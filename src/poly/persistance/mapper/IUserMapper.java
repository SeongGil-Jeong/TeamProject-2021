package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {
    // 사용자 회원가입
    int insertUser(UserDTO pDTO) throws Exception;

    //회원 가입 전 중복 체크하기
    UserDTO getUserExists(UserDTO pDTO) throws Exception;

    // 사용자 로그인
    UserDTO getUserLoginCheck(UserDTO pDTO) throws Exception;
}
