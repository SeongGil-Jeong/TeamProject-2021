package poly.service;

import poly.dto.UserDTO;

public interface IUserService {
    int insertUser(UserDTO pDTO) throws Exception; //  회원가입

    UserDTO getUserLoginCheck(UserDTO pDTO) throws Exception; //   로그인
}
