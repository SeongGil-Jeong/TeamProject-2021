package poly.service;

import poly.dto.BusinessDTO;

import java.util.List;

public interface IBusinessService {
    int insertBusiness(BusinessDTO pDTO) throws Exception; //  회원가입

    BusinessDTO businessLogin(BusinessDTO pDTO) throws Exception; // 로그인

    List<BusinessDTO> selectBnsName() throws Exception; // 사업자 이름 목록 조회하기
}
