package com.jcg.monitor.infrastructure.dao;

import com.jcg.monitor.infrastructure.po.MonitorDataMapNode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMonitorDataMapNodeDao {
    List<MonitorDataMapNode> queryMonitoryDataMapNodeList(MonitorDataMapNode monitorDataMapNodeReq);
}
