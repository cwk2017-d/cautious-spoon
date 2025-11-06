package work.service.impl;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import work.entity.Job;
import work.mapper.JobMapper;
import work.service.JobService;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class JobServiceImpl implements JobService {
    private SqlSessionFactory getSqlSessionFactory() {
        try {
            InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
            return new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("获取SqlSessionFactory失败", e);
        }
    }

    @Override
    public boolean addJob(Job job) {
        SqlSession sqlSession = null;
        try {
            sqlSession = getSqlSessionFactory().openSession();
            JobMapper jobMapper = sqlSession.getMapper(JobMapper.class);
            int result = jobMapper.insertJob(job);
            sqlSession.commit();
            return result > 0;
        } catch (Exception e) {
            if (sqlSession != null) {
                sqlSession.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    @Override
    public boolean deleteJob(Integer id) {
        SqlSession sqlSession = null;
        try {
            sqlSession = getSqlSessionFactory().openSession();
            JobMapper jobMapper = sqlSession.getMapper(JobMapper.class);
            int result = jobMapper.deleteJob(id);
            sqlSession.commit();
            return result > 0;
        } catch (Exception e) {
            if (sqlSession != null) {
                sqlSession.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    @Override
    public boolean updateJob(Job job) {
        SqlSession sqlSession = null;
        try {
            sqlSession = getSqlSessionFactory().openSession();
            JobMapper jobMapper = sqlSession.getMapper(JobMapper.class);
            int result = jobMapper.updateJob(job);
            sqlSession.commit();
            return result > 0;
        } catch (Exception e) {
            if (sqlSession != null) {
                sqlSession.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    @Override
    public Job getJobById(Integer id) {
        SqlSession sqlSession = null;
        try {
            sqlSession = getSqlSessionFactory().openSession();
            JobMapper jobMapper = sqlSession.getMapper(JobMapper.class);
            return jobMapper.selectJobById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    @Override
    public List<Job> getAllJobs() {
        SqlSession sqlSession = null;
        try {
            sqlSession = getSqlSessionFactory().openSession();
            JobMapper jobMapper = sqlSession.getMapper(JobMapper.class);
            return jobMapper.selectAllJobs();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    @Override
    public List<Job> searchJobs(Map<String, Object> condition) {
        SqlSession sqlSession = null;
        try {
            sqlSession = getSqlSessionFactory().openSession();
            JobMapper jobMapper = sqlSession.getMapper(JobMapper.class);
            return jobMapper.selectJobsByCondition(condition);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }
}