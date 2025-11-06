package work.mapper;

import work.entity.Job;

import java.util.List;
import java.util.Map;

public interface JobMapper {
    // 添加岗位
    int insertJob(Job job);
    
    // 删除岗位
    int deleteJob(Integer id);
    
    // 更新岗位信息
    int updateJob(Job job);
    
    // 根据ID查询岗位
    Job selectJobById(Integer id);
    
    // 查询所有岗位
    List<Job> selectAllJobs();
    
    // 条件查询岗位
    List<Job> selectJobsByCondition(Map<String, Object> condition);
}