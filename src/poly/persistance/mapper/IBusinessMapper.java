package poly.persistance.mapper;

import config.Mapper;
import poly.dto.BusinessDTO;

import java.util.List;

@Mapper("BusinessMapper")
public interface IBusinessMapper {
    int insertBusiness(BusinessDTO pDTO) throws Exception; // 사업자 회원가입

    BusinessDTO getBnsExists(BusinessDTO pDTO) throws Exception; // 회원가입 중복 확인

    BusinessDTO businessLogin(BusinessDTO pDTO) throws Exception; // 사업자 로그인

    List<BusinessDTO> selectBnsName() throws Exception; // 사업자 이름 (세탁소 이름) 조회 / 선호하는 지점 선택 시 사용


}
