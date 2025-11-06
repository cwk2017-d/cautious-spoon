-- 创建job表
CREATE TABLE IF NOT EXISTS job (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT '岗位ID',
    company_name VARCHAR(100) NOT NULL COMMENT '企业名称',
    position_name VARCHAR(100) NOT NULL COMMENT '岗位名称',
    salary VARCHAR(50) NOT NULL COMMENT '薪资',
    requirements TEXT NOT NULL COMMENT '岗位要求',
    location VARCHAR(50) NOT NULL COMMENT '工作地点',
    post_time VARCHAR(20) NOT NULL COMMENT '发布时间',
    job_type VARCHAR(20) NOT NULL COMMENT '职位类型：全职、兼职、实习'
) COMMENT='IT岗位信息表';

-- 插入一些测试数据
INSERT INTO job (company_name, position_name, salary, requirements, location, post_time, job_type)
VALUES 
('腾讯科技', 'Java开发工程师', '25k-35k', '本科及以上学历，3年以上Java开发经验，熟悉Spring Boot、MySQL等技术栈', '深圳', '2024-10-01', '全职'),
('阿里巴巴', '前端开发工程师', '20k-30k', '精通HTML、CSS、JavaScript，熟悉React或Vue框架，有大型项目经验', '杭州', '2024-10-05', '全职'),
('百度', '测试工程师', '18k-25k', '熟悉软件测试流程，掌握自动化测试工具，有性能测试经验', '北京', '2024-10-10', '全职');