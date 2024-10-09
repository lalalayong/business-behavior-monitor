package com.jcg.monitor.domain.service;

import com.alibaba.fastjson.JSONObject;
import com.jcg.monitor.domain.model.entity.MonitorDataEntity;
import com.jcg.monitor.domain.model.entity.MonitorDataMapEntity;
import com.jcg.monitor.domain.model.valobj.GatherNodeExpressionVO;
import com.jcg.monitor.domain.repository.IMonitorRepository;
import com.jcg.monitor.types.Constants;
import ognl.Ognl;
import ognl.OgnlContext;
import ognl.OgnlException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LogAnalyticalService implements ILogAnalyticalService {

    @Resource
    private IMonitorRepository repository;

    @Override
    public void doAnalytical(String systemName, String className, String methodName, List<String> logList) throws OgnlException {
        // 查询匹配解析节点
        List<GatherNodeExpressionVO> gatherNodeExpressionVOs = repository.queryGatherNodeExpressionVO(systemName, className, methodName);
        if (null == gatherNodeExpressionVOs || gatherNodeExpressionVOs.isEmpty()) return;

        for (GatherNodeExpressionVO gatherNodeExpressionVO : gatherNodeExpressionVOs) {
            String monitoryName = repository.queryMonitoryNameByMonitoryId(gatherNodeExpressionVO.getMonitorId());

            List<GatherNodeExpressionVO.Filed> fileds = gatherNodeExpressionVO.getFileds();
            for (GatherNodeExpressionVO.Filed filed : fileds) {
                Integer logIndex = filed.getLogIndex();

                String logName = logList.get(0);
                if (!logName.equals(filed.getLogName())) {
                    continue;
                }

                String attributeValue = "";
                String logStr = logList.get(logIndex);
                if ("Object".equals(filed.getLogType())) {
                    OgnlContext context = new OgnlContext();
                    context.setRoot(JSONObject.parseObject(logStr));
                    Object root = context.getRoot();
                    attributeValue = String.valueOf(Ognl.getValue(filed.getAttributeOgnl(), context, root));
                } else {
                    attributeValue = logStr.trim();
                    if (attributeValue.contains(Constants.COLON)) {
                        attributeValue = attributeValue.split(Constants.COLON)[1].trim();
                    }
                }

                MonitorDataEntity monitorDataEntity = MonitorDataEntity.builder()
                        .monitorId(gatherNodeExpressionVO.getMonitorId())
                        .monitorName(monitoryName)
                        .monitorNodeId(gatherNodeExpressionVO.getMonitorNodeId())
                        .systemName(gatherNodeExpressionVO.getGatherSystemName())
                        .clazzName(gatherNodeExpressionVO.getGatherClazzName())
                        .methodName(gatherNodeExpressionVO.getGatherMethodName())
                        .attributeName(filed.getAttributeName())
                        .attributeField(filed.getAttributeField())
                        .attributeValue(attributeValue)
                        .build();

                repository.saveMonitoryData(monitorDataEntity);
            }

        }

    }

    @Override
    public List<MonitorDataMapEntity> queryMonitorDataMapEntityList() {
        return repository.queryMonitorDataMapEntityList();
    }

}
