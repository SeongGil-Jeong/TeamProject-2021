package poly.service;

import poly.dto.BusinessDTO;
import poly.dto.OrderDTO;
import poly.dto.UserDTO;

import java.util.List;

public interface IOrderService {
    List<OrderDTO> bnsSelectOrder(BusinessDTO pDTO) throws Exception;

    int updateStatus(OrderDTO pDTO) throws Exception;

    List<OrderDTO> userSelectOrder(UserDTO pDTO) throws Exception;

    int deleteOrder(OrderDTO pDTO) throws Exception;
}
