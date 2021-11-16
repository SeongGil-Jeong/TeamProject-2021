package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.dto.BusinessDTO;
import poly.dto.OrderDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.IOrderMapper;
import poly.service.IOrderService;

import javax.annotation.Resource;
import java.util.List;

@Service("OrderService")
public class OrderService implements IOrderService {
    @Resource(name = "OrderMapper")
    private IOrderMapper orderMapper;

    @Override // 사업자 주문 조회
    public List<OrderDTO> bnsSelectOrder(BusinessDTO pDTO) throws Exception {
        return orderMapper.bnsSelectOrder(pDTO);
    }

    @Override // 주문 상태 변경 (사업자)
    public int updateStatus(OrderDTO pDTO) throws Exception {
        return orderMapper.updateStatus(pDTO);
    }

    @Override // 사용자 주문 조회 / USER_SEQ = #{user_seq}
    public List<OrderDTO> userSelectOrder(UserDTO pDTO) throws Exception {
        return orderMapper.userSelectOrder(pDTO);
    }
}
