package work.service;

import work.entity.Job;

import java.util.List;
import java.util.Map;

public interface JobService {
    // 添加岗位
    boolean addJob(Job job);
    
    // 删除岗位
    boolean deleteJob(Integer id);
    
    // 更新岗位信息
    boolean updateJob(Job job);
    
    // 根据ID查询岗位
    Job getJobById(Integer id);
    
    // 获取所有岗位
    List<Job> getAllJobs();
    
    // 条件查询岗位
    List<Job> searchJobs(Map<String, Object> condition);
}