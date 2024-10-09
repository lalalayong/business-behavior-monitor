package com.jcg.monitor.infrastructure.dao;

import com.jcg.monitor.infrastructure.po.MonitorDataMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMonitorDataMapDao {
    String queryMonitorNameByMonitoryId(String monitorId);

    List<MonitorDataMap> queryMonitorDataMapEntityList();
}
