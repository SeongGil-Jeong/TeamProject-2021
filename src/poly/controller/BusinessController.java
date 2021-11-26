package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.BusinessDTO;
import poly.dto.OrderDTO;
import poly.service.IBusinessService;
import poly.service.IOrderService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BusinessController {
    @Resource(name = "BusinessService")
    private IBusinessService businessService;

    @Resource(name = "OrderService")
    private IOrderService orderService;


    Logger log = Logger.getLogger(this.getClass());

    @RequestMapping(value = "business/bnsRegForm")// 회원가입 창 이동
    public String bnsRegForm()throws Exception {
        log.info(this.getClass().getName() + ".business/bnsRegForm ok!");

        return "/business/bnsRegForm";
    }

    @RequestMapping(value = "business/bnsLoginForm") // 로그인 화면 이동
    public String bnsLoginForm()throws Exception {
        log.info(this.getClass().getName() + ".business/bnsLoginForm ok!");

        return "/business/bnsLoginForm";
    }

    @RequestMapping(value = "business/bnsMain") // 사업자 Main 화면 이동
    public String bnsMain(HttpSession session, ModelMap model)throws Exception {
        log.info(this.getClass().getName() + ".busuness/bnsMain ok!");
        String SS_BNS_SEQ = CmmUtil.nvl((String) session.getAttribute("SS_BNS_SEQ"));
        String msg = "";

        BusinessDTO pDTO = new BusinessDTO();

        pDTO.setBns_seq(SS_BNS_SEQ);
        List<OrderDTO> rList = orderService.bnsSelectOrder(pDTO);
        if (rList == null) {
            rList = new ArrayList<OrderDTO>();
            msg = "주문이 없습니다";
        } else {
            msg = rList.size() + "개의 주문이 있습니다";
        }

        model.addAttribute("rList", rList);
        model.addAttribute("msg", msg);
        return "/business/bnsMain";
    }

    @RequestMapping("business/insertBusiness") // 회원가입
    public String insertBusiness(HttpServletRequest request, ModelMap model, HttpServletResponse response)throws Exception {
        log.info(getClass().getName() + ".insertBusiness Start!");
        String msg = "";
        String url = "";
        try {
            String bns_id = CmmUtil.nvl(request.getParameter("bns_id")); // id
            String bns_password = CmmUtil.nvl(request.getParameter("bns_password"));
            String bns_name = CmmUtil.nvl(request.getParameter("bns_name")); // name
            String bns_code = CmmUtil.nvl(request.getParameter("bns_code")); // 사업자 번호
            String bns_addr = CmmUtil.nvl(request.getParameter("bns_addr")); // 주소
            String bns_addr2 = CmmUtil.nvl(request.getParameter("bns_addr2")); // 주소 2

            log.info("bns_id : " + bns_id);
            log.info("bns_password : " + bns_password);
            log.info("bns_name : " + bns_name);
            log.info("bns_code : " + bns_code);
            log.info("bns_addr : " + bns_addr);
            log.info("bns_addr2 : " + bns_addr2);
            BusinessDTO pDTO = new BusinessDTO();

            pDTO.setBns_id(bns_id);
            pDTO.setBns_password(EncryptUtil.encHashSHA256(bns_password));
            pDTO.setBns_code(bns_code);
            pDTO.setBns_name(bns_name);
            pDTO.setBns_addr(bns_addr);
            pDTO.setBns_addr2(bns_addr2);

            int res = businessService.insertBusiness(pDTO);
            log.info("res : " + res);
            if (res == 1) {
                msg = "회원가입되었습니다.";
                System.out.println("회원가입되었습니다.");
                url = "/index.do";

            } else if (res == 2) {
                msg = "이미 가입된 ID/사업자번호입니다.";
                url = "/business/bnsRegForm.do";
            } else {
                msg = "오류로 인해 회원가입이 실패하였습니다";
                url = "/index.do";
            }

            pDTO = null;
        } catch (Exception e) {

            //저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다 :" + e.toString();
            System.out.println("오류로 인해 회원가입이 실패하였습니다");
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".insertBusiness end!");
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);
        }

        return "/redirect";
    }

    @RequestMapping(value = "business/businessLogin") // 로그인
    public String businessLogin(HttpServletRequest request, HttpSession session, ModelMap model)throws Exception {
        log.info(this.getClass().getName() + ".businessLogin start!");
        String msg = "";
        String url = "";
        try {
            String bns_id = CmmUtil.nvl(request.getParameter("bns_id"));
            String bns_password = CmmUtil.nvl(request.getParameter("bns_password"));

            log.info("bns_id : " + bns_id);

            BusinessDTO pDTO = new BusinessDTO();

            pDTO.setBns_id(bns_id);
            pDTO.setBns_password(EncryptUtil.encHashSHA256(bns_password));

            BusinessDTO rDTO = businessService.businessLogin(pDTO);

            if (rDTO == null) {
                rDTO = new BusinessDTO();
                msg = "아이디/비밀번호를 확인해주세요";
                url = "/business/bnsLoginForm.do";
            } else {
                msg = "로그인 성공!";
                url = "/business/bnsMain.do"; // main 화면으로 이동

                // session에 저장
                session.setAttribute("SS_BNS_ID", rDTO.getBns_id());
                session.setAttribute("SS_BNS_NAME", rDTO.getBns_name());
                session.setAttribute("SS_BNS_SEQ", rDTO.getBns_seq()); // bns_seq를 사용해서 조회가능
            }
            rDTO = null;


        } catch (Exception e) {
            msg = "실패하였습니다 :" + e.toString();
            System.out.println("오류로 인해 로그인이 실패하였습니다");
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            log.info(this.getClass().getName() + ".insertBusiness end!");
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);
        }

        return "/redirect";
    }

    @RequestMapping(value = "business/bnsLogout") // 로그아웃
    public String bnsLogout(HttpServletRequest request, ModelMap model) {
        log.info(this.getClass().getName() + ".Logout start!");
        HttpSession session = request.getSession();

        String url = "/index.do";
        String msg = "로그아웃 성공";
        session.invalidate(); // session clear
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        return "/redirect";
    }

}
