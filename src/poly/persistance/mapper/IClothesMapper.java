package poly.persistance.mapper;

import config.Mapper;
import poly.dto.ClothesDTO;
import poly.dto.UserDTO;

import java.util.List;
@Mapper("ClothesMapper")
public interface IClothesMapper {
    int insertClothes(ClothesDTO pDTO) throws Exception; // 옷 추가하기

    List<ClothesDTO> selectClothesList(UserDTO pDTO) throws Exception; // 옷 조회하기 / 옷장에 옷 보여주기

    int deleteClothes(ClothesDTO pDTO) throws Exception; // 옷 삭제하기
}
