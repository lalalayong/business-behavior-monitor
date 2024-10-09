package com.jcg.monitor.test.trigger;

import com.alibaba.fastjson2.JSON;
import com.jcg.monitor.trigger.http.MonitorController;
import com.jcg.monitor.trigger.http.dto.MonitorDataDTO;
import com.jcg.monitor.trigger.http.dto.MonitorDataMapDTO;
import com.jcg.monitor.trigger.http.dto.MonitorFlowDataDTO;
import com.jcg.monitor.types.Response;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class MonitorControllerTest {

    @Resource
    private MonitorController monitorController;

    @Test
    public void test_queryMonitorDataMapEntityList() {
        Response<List<MonitorDataMapDTO>> response = monitorController.queryMonitorDataMapEntityList();
        log.info("测试结果: {}", JSON.toJSONString(response));
    }

    @Test
    public void test_queryMonitorFlowMap() {
        Response<MonitorFlowDataDTO> response = monitorController.queryMonitorFlowMap("129009");
        log.info("测试结果: {}", JSON.toJSONString(response));
    }

    @Test
    public void test_queryMonitorDataList(){
        Response<List<MonitorDataDTO>> response = monitorController.queryMonitorDataList("","","");
        log.info("测试结果: {}", JSON.toJSONString(response));
    }

}
