package poly.controller;

import org.apache.log4j.Logger;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.BusinessDTO;
import poly.dto.OrderDTO;
import poly.dto.UserDTO;
import poly.service.IOrderService;
import poly.util.CmmUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {
    @Resource(name = "OrderService")
    private IOrderService orderService;
    Logger log = Logger.getLogger(this.getClass());

    @RequestMapping(value = "order/bnsSelectOrder") // 사업자에서 주문 조회하기
    public String bnsSelectOrder(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".order/bnsSelectOrder start!");
        String msg = ""; // 주문이 없을 경우 "주문이 없습니다" / 주문이 있을 경우 "~개의 주문이 있습니다"
        try {
            String SS_BNS_SEQ = CmmUtil.nvl((String) session.getAttribute("SS_BNS_SEQ"));
            log.info("SS_BNS_SEQ : " + SS_BNS_SEQ);

            BusinessDTO pDTO = new BusinessDTO();

            pDTO.setBns_seq(SS_BNS_SEQ); // session에서 받아온 seq를 저장

            List<OrderDTO> rList = orderService.bnsSelectOrder(pDTO);
            if (rList == null) {
                rList = new ArrayList<OrderDTO>();
                msg = "주문이 없습니다";
            } else {
                msg = rList.size() + "개의 주문이 있습니다";
            }

            model.addAttribute("rList", rList);

        } catch (Exception e) {
            msg = "실패하였습니다 :" + e.toString();
            System.out.println("오류로 인해 주문을 불러올 수 없습니다.");
            log.info(e.toString());
            e.printStackTrace();
        }finally {
            log.info(this.getClass().getName() + ".order/bnsSelectOrder end!");
            model.addAttribute("msg", msg);

            return "/business/bnsMain";
        }
    }

    @RequestMapping(value = "order/userSelectOrder") // 사용자 주문 조회하기
    public String userSelectOrder(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".order/userSelectOrder Start!");
        String msg = "";
        try {
            String SS_USER_SEQ = CmmUtil.nvl((String) session.getAttribute("SS_USER_SEQ"));
            log.info("SS_USER_SEQ : " + SS_USER_SEQ);
            UserDTO pDTO = new UserDTO();
            pDTO.setUser_seq(SS_USER_SEQ);

            List<OrderDTO> rList = orderService.userSelectOrder(pDTO);

            if (rList == null) {
                rList = new ArrayList<OrderDTO>();
                msg = "주문이 없습니다";
            } else {
                msg = rList.size() + "개의 주문이 있습니다";
            }
            model.addAttribute("msg", msg);
            model.addAttribute("rList", rList);
        } catch (Exception e) {
            msg = "실패하였습니다 :" + e.toString();
            System.out.println("오류로 인해 주문을 불러올 수 없습니다");
            log.info(e.toString());
            e.printStackTrace();
        }finally {
            log.info(this.getClass().getName() + ".order/userSelectOrder end!");
            model.addAttribute("msg", msg);

            return "/user/userMain";
        }
    }

    @RequestMapping(value = "order/updateStatus") // 주문 상태 변경하기
    public String updateStatus(HttpServletRequest request, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".business/updateStatus start!");
        String msg = "";
        String url = "";
        try {
            String order_seq = CmmUtil.nvl(request.getParameter("order_seq"));
            log.info("order_seq : " + order_seq); // 세탁 완료 시 변경 불가능 or 삭제 옵션 추가

            OrderDTO pDTO = new OrderDTO();
            pDTO.setOrder_seq(order_seq);

            int res = orderService.updateStatus(pDTO);

            if (res == 0) {
                msg = "상태 변경 실패";
            } else {
                msg = "상태 변경 성공";
            }

        } catch (Exception e) {
            msg = "실패하였습니다. : (" + e.toString() + ")";
            log.info(e.toString());
            e.printStackTrace();
        }finally {
            url = "/business/bnsMain.do";
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);

            return "/redirect";

        }


    }

}
