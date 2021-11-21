package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.ClothesDTO;
import poly.service.IClothesService;
import poly.util.CmmUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ClothesController {
    Logger log = Logger.getLogger(this.getClass());
    @Resource(name = "ClothesService")
    private IClothesService clothesService;

    @RequestMapping(value = "clothes/insertClothes")
    public String insertClothes(HttpServletRequest request, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".clothes/insertClothes start!");
        String user_seq = CmmUtil.nvl((String) request.getParameter("user_seq"));
        String clothes_name = CmmUtil.nvl((String) request.getParameter("clothes_name"));
        String clothes_type = CmmUtil.nvl((String) request.getParameter("clothes_type"));
        String clothesInfo= CmmUtil.nvl((String) request.getParameter("clothesInfo_list"));
        String msg = "";
        String url = "";

        log.info("user_seq : " + user_seq);
        log.info("clothes_name : " + clothes_name);
        log.info("clothes_type : " + clothes_type);
        log.info("clothesInfo_list : " + clothesInfo);

        ClothesDTO pDTO = new ClothesDTO();
        pDTO.setUser_seq(user_seq);
        pDTO.setClothes_name(clothes_name);
        pDTO.setClothes_type(clothes_type);
        pDTO.setClothes_info(clothesInfo);

        int res = clothesService.insertClothes(pDTO);

        if (res == 1) {
            msg = "옷 등록 성공";
        } else {
            msg = "옷 등록 실패";
        }
        url = "/user/userMain.do";
        model.addAttribute("url", url);
        model.addAttribute("msg", msg);

        return "/redirect";
    }
}
