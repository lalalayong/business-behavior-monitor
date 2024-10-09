package com.jcg.monitor.infrastructure.dao;

import com.jcg.monitor.infrastructure.po.MonitorDataMapNodeLink;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMonitorDataMapNodeLinkDao {
    List<MonitorDataMapNodeLink> queryMonitorNodeLinkConfigByMonitorId(String monitorId);
}
