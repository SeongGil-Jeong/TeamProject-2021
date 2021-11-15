package poly.persistance.mapper;

import config.Mapper;
import poly.dto.BusinessDTO;
import poly.dto.OrderDTO;
import poly.dto.UserDTO;

import java.util.List;

@Mapper("OrderMapper")
public interface IOrderMapper {
    List<OrderDTO> bnsSelectOrder(BusinessDTO pDTO) throws Exception; // 사업자 주문 조회

    List<OrderDTO> userSelectOrder(UserDTO pDTO) throws Exception; // 사용자 주문 조회

    int updateStatus(OrderDTO pDTO) throws Exception; // 사업자가 주문 상태 변경 준비중 -> 세탁중
}
