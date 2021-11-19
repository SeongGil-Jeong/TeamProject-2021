package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.BusinessDTO;
import poly.dto.OrderDTO;
import poly.dto.UserDTO;
import poly.service.IBusinessService;
import poly.service.IOrderService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    @Resource(name = "UserService")
    private IUserService userService;

    @Resource(name = "BusinessService")
    private IBusinessService businessService;

    @Resource(name = "OrderService")
    private IOrderService orderService;

    private Logger log = Logger.getLogger(this.getClass());

    @RequestMapping(value = "user/userRegForm") // 유저 회원가입 창 이동
    public String userRegForm(ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".user/userRegForm ok!");

        List<BusinessDTO> rList = businessService.selectBnsName();

        model.addAttribute("rList", rList); // 사업자 지점 목록을 넘겨줌

        return "/user/userRegForm";
    }

    @RequestMapping(value = "user/washingInfo")
    public String washingInfo(ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".user/washingInfo ok!");
        return "/washing/washingInfo";
    }

    @RequestMapping(value = "user/userMain") // 사용자 main page 이동
    public String userMain(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".user/userMain ok!");
        String SS_USER_SEQ = CmmUtil.nvl((String) session.getAttribute("SS_USER_SEQ"));
        String msg = "";
        UserDTO pDTO = new UserDTO();
        pDTO.setUser_seq(SS_USER_SEQ);
        List<OrderDTO> rList = orderService.userSelectOrder(pDTO);
        if (rList == null) {
            rList = new ArrayList<OrderDTO>();
            msg = "주문이 없습니다";
        } else {
            msg = rList.size() + "개의 주문이 있습니다";
        }

        model.addAttribute("rList", rList);
        model.addAttribute("msg", msg);

        return "/user/userMain";
    }

    @RequestMapping(value = "user/insertUser") // 회원가입
    public String insertUser(HttpServletRequest request, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".user/insertUser start!");
        String msg = "";
        String url = "";

        UserDTO pDTO = null;
        try {
            String user_id = CmmUtil.nvl(request.getParameter("user_id"));//아이디
            String user_name = CmmUtil.nvl(request.getParameter("user_name"));//이름
            String user_nic = CmmUtil.nvl(request.getParameter("user_nic"));//이름
            String user_password = CmmUtil.nvl(request.getParameter("user_password"));//비밀번호
            String email = CmmUtil.nvl(request.getParameter("email"));//이메일
            String like_branch = CmmUtil.nvl(request.getParameter("like_branch"));
            String user_addr = CmmUtil.nvl(request.getParameter("user_addr"));//주소
            String user_addr2 = CmmUtil.nvl(request.getParameter("user_addr2"));//상세주소

            log.info("user_id : " + user_id);
            log.info("user_name : " + user_name);
            log.info("user_nic : " + user_nic);
            log.info("password : " + user_password);
            log.info("email : " + email);
            log.info("like_branch : " + like_branch);
            log.info("addr : " + user_addr);
            log.info("addr2 : " + user_addr2);

            pDTO = new UserDTO();

            pDTO.setUser_id(user_id);
            pDTO.setUser_name(user_name);
            pDTO.setUser_nic(user_nic);

            pDTO.setUser_password(EncryptUtil.encHashSHA256(user_password));
            pDTO.setEmail(EncryptUtil.encAES128CBC(email));

            pDTO.setUser_addr(user_addr);
            pDTO.setUser_addr2(user_addr2);

            int res = userService.insertUser(pDTO);

            if (res == 1) {
                msg = "회원가입되었습니다.";
                url = "/index.do"; // index page로 이동하기
                System.out.println("회원가입되었습니다.");
                //추후 회원가입 입력화면에서 ajax를 활용해서 아이디 중복, 이메일 중복을 체크하길 바람
            } else if (res == 2) {
                msg = "이미 가입된 이메일 주소/ id 입니다.";
                url = "/user/userRegForm.do"; // 회원가입 창으로 이동 / 회원가입 다시 시도
            } else {
                msg = "오류로 인해 회원가입이 실패하였습니다";
                url = "/index.do";
                System.out.println("오류로 인해 회원가입이 실패하였습니다");
            }

        } catch (Exception e) {
            //저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다 :" + e.toString();
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            log.info(this.getClass().getName() + ".insertUserInfo end!");

            //회원가입 여부 결과 메시지 전달하기
            model.addAttribute("msg", msg);

            //회원가입 여부 결과 메시지 전달하기
            model.addAttribute("url", url);

            //변수 초기화(메모리 효율화 시키기위해 사용함)
            pDTO = null;
        }
        return "/redirect";


    }

    @RequestMapping(value = "user/userLogin")
    public String userLogin(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".user/usrLogin start!");
        String msg = "";
        String url = "";

        int res = 0;

        UserDTO pDTO = null; // 웝에서 받은 정보를 저장할 변수
        UserDTO rDTO = null; // DB에서 받아온 정보를 저장해서 jsp로 넘겨줄 변수

        try {
            String user_id = CmmUtil.nvl(request.getParameter("user_id"));
            String user_password = CmmUtil.nvl(request.getParameter("user_password"));

            log.info("user_id : " + user_id);
            log.info("user_password : " + user_password);

            pDTO = new UserDTO();
            pDTO.setUser_id(user_id);
            pDTO.setUser_password(EncryptUtil.encHashSHA256(user_password));

            rDTO = userService.getUserLoginCheck(pDTO);

            if (CmmUtil.nvl(rDTO.getUser_id()).length() > 0) { // 로그인 성공 시
                msg = rDTO.getUser_id() + "님 로그인 성공!";
                url = "/user/userMain.do";
                session.setAttribute("SS_USER_ID", rDTO.getUser_id());
                session.setAttribute("SS_USER_NAME", rDTO.getUser_name());
                session.setAttribute("SS_USER_ADDR", rDTO.getUser_addr());
                session.setAttribute("SS_USER_ADDR2", rDTO.getUser_addr2());
                session.setAttribute("SS_USER_SEQ", rDTO.getUser_seq());
            } else {
                url = "/index.do";
                msg = "ID / PASSWORD를 확인 부탁드립니다.";
            }
        } catch (Exception e) {
            log.info(e.toString());
            e.printStackTrace();
        }finally {
            log.info(this.getClass().getName() + "./user/userLogin end!");
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);
            return "/redirect";
        }
    }

    @RequestMapping(value = "user/userLogout") // 로그아웃
    public String userLogout(HttpServletRequest request, ModelMap model) {
        log.info(this.getClass().getName() + ".user/userLogout start");
        HttpSession session = request.getSession();

        String url = "/index.do";
        String msg = "로그아웃 성공";
        session.invalidate(); // session clear
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        return "/redirect";
    }
}
