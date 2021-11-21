package poly.service;

import poly.dto.ClothesDTO;
import poly.dto.UserDTO;

import java.util.List;

public interface IClothesService {
    int insertClothes(ClothesDTO pDTO) throws Exception; // 옷 추가하기

    List<ClothesDTO> selectClothesList(UserDTO pDTO) throws Exception; // 옷 정보 조회하기

}
