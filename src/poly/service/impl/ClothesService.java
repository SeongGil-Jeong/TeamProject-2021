package poly.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import poly.dto.ClothesDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.IClothesMapper;
import poly.service.IClothesService;

import javax.annotation.Resource;
import java.util.List;

@Service("ClothesService")
public class ClothesService implements IClothesService {

    Logger log = Logger.getLogger(this.getClass());
    @Resource(name = "ClothesMapper")
    private IClothesMapper clothesMapper;

    @Override
    public int insertClothes(ClothesDTO pDTO, String clothesInfo) throws Exception {
        return clothesMapper.insertClothes(pDTO);
    }

    @Override
    public List<ClothesDTO> selectClothesList(UserDTO pDTO) throws Exception {
        return clothesMapper.selectClothesList(pDTO);
    }

}
