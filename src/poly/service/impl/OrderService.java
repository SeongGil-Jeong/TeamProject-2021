package poly.service.impl;

import org.apache.log4j.Logger;
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
    Logger log = Logger.getLogger(this.getClass());
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

    @Override // 사용자 주문 확인 / 주문 삭제 / ORDER_STATUS = 3 AND ORDER_SEQ = #{order_seq}
    public int deleteOrder(OrderDTO pDTO) throws Exception {
        return orderMapper.deleteOrder(pDTO);
    }
    @Override // 세탁이 완료된 주문 삭제
    public int deleteOrder(OrderDTO pDTO, String orderSeqList) throws Exception {
        int res = 0;
        String[] orderSeqListArr = orderSeqList.split(",");
        log.info("orderSeqListArr[0] : " + orderSeqListArr[0]);
        for (int i = 0; i < orderSeqListArr.length; i++) {
            if (orderSeqListArr[i] == null) { // null 값일경우 0으로 변경 seq는 1부터 시작하기 때문에 데이터가 지워지지 않음
                orderSeqListArr[i] = "0";
            }
            pDTO.setOrder_seq(orderSeqListArr[i]);

            res += orderMapper.deleteOrder(pDTO);
            log.info("orderSeqListArr[" + i + "] res : " + (res-1) + " ( i == res => ok )"); // res값과 i값이 같으면 계속 1씩 증가됐다는 의미
        }
        res -= orderSeqListArr.length;
        pDTO = null;


        return res;
    }

    @Override // 주문 추가 (사용자가 주문)
    public int insertOrder(OrderDTO pDTO) throws Exception {
        log.info(this.getClass().getName()+" insertOrder start !!");

        if(pDTO==null) {
            pDTO = new OrderDTO();
        }

        int res = orderMapper.insertOrder(pDTO);

        return res;
    }
}
