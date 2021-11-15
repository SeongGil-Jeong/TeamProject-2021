package poly.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import poly.dto.UserDTO;
import poly.persistance.mapper.IUserMapper;
import poly.service.IUserService;
import poly.util.CmmUtil;

import javax.annotation.Resource;

@Service("UserService")
public class UserService implements IUserService {
    @Resource(name = "UserMapper")
    private IUserMapper userMapper;

    private Logger log = Logger.getLogger(this.getClass());
    @Override // 사용자 회원가입
    public int insertUser(UserDTO pDTO) throws Exception {
        log.info(this.getClass().getName()+" 회원 가입 로직 실행 ");

        //회원가입 성공: 1, 아이디 중복으로 인한 가입취소: 2, 기타에러 발생:0
        int res = 0;

        if (pDTO == null) {
            pDTO = new UserDTO();

        }
        UserDTO rDTO = userMapper.getUserExists(pDTO); // 회원가입 중복 방지

        //mapper에서 값이 정상적으로 못넘어오는 경우를 대비하기위해 사용함
        if(rDTO == null) {
            rDTO = new UserDTO();
        }

        if(CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")){
            res=2;
            //회원가입이 중복이 아니므로 회원가입 진행함
        } else {
            //회원가입
            res = userMapper.insertUser(pDTO);
        }
        return res;
    }

    @Override // 사용자 로그인
    public UserDTO getUserLoginCheck(UserDTO pDTO) throws Exception{
        //로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위한 mapper호출하기
        UserDTO rDTO = userMapper.getUserLoginCheck(pDTO);

        if (rDTO == null) {
            rDTO = new UserDTO();

        }
        return rDTO;
    }
}
