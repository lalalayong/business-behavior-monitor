package com.jcg.monitor.infrastructure.dao;

import com.jcg.monitor.infrastructure.po.MonitorData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMonitorDataDao {

    List<MonitorData> queryMonitorDataList(MonitorData monitorDataReq);

    void insert(MonitorData monitorDataReq);
}
