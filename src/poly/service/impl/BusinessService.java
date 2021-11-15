package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.dto.BusinessDTO;
import poly.persistance.mapper.IBusinessMapper;
import poly.service.IBusinessService;
import poly.util.CmmUtil;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("BusinessService")
public class BusinessService implements IBusinessService {
    @Resource(name = "BusinessMapper")
    private IBusinessMapper businessMapper;

    @Override  // 사업자 회원가입
    public int insertBusiness(BusinessDTO pDTO) throws Exception {
        int res = 0;

        if (pDTO == null) {
            pDTO = new BusinessDTO();

        }
        BusinessDTO rDTO = businessMapper.getBnsExists(pDTO);

        if(rDTO == null) {
            rDTO = new BusinessDTO();
        }

        //중복된 회원 정보가 있는 경우, 결과값을 2로 변경하고 더이상 작업을 진행하지않음
        if(CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")){
            res=2; // 중복
        } else {
            //회원가입
            res = businessMapper.insertBusiness(pDTO);
        }
        return res;
    }

    @Override // 사업자 로그인
    public BusinessDTO businessLogin(BusinessDTO pDTO) throws Exception {

        if (pDTO == null) {
            pDTO = new BusinessDTO();
        }
        return businessMapper.businessLogin(pDTO);
    }

    @Override // 사업자 조회 / 유저 가입 시 선호하는 지점 선택에 사용
    public List<BusinessDTO> selectBnsName() throws Exception {
        List<BusinessDTO> rList = businessMapper.selectBnsName();

        if (rList == null) {
            rList = new ArrayList<BusinessDTO>();
        }

        return rList;
    }
}


