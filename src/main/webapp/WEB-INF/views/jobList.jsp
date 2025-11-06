<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>智联招聘风格 - IT岗位求职记录系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* 全局样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'PingFang SC', 'Microsoft YaHei', Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        
        /* 顶部导航栏 - 智联招聘风格 */
        .top-nav {
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 60px;
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #00b38a;
            text-decoration: none;
            display: flex;
            align-items: center;
        }
        
        .logo i {
            margin-right: 8px;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
        }
        
        .nav-menu li {
            margin-left: 30px;
        }
        
        .nav-menu a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            transition: color 0.3s;
        }
        
        .nav-menu a:hover {
            color: #00b38a;
        }
        
        .user-area {
            display: flex;
            align-items: center;
            /* 登录注册功能已移除 */
        }
        
        .btn {
            display: inline-block;
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
        }
        
        .btn-primary {
            background-color: #00b38a;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #009975;
        }
        
        /* 搜索区域 - 智联招聘风格 */
        .search-section {
            background: linear-gradient(135deg, #00b38a 0%, #009975 100%);
            padding: 40px 0;
            text-align: center;
        }
        
        .search-container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            padding: 30px;
        }
        
        .search-tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        
        .search-tab {
            padding: 8px 24px;
            margin: 0 10px;
            border-radius: 20px;
            background: #f5f5f5;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 500;
        }
        
        .search-tab.active {
            background: #00b38a;
            color: white;
        }
        
        .search-form {
            display: flex;
            gap: 15px;
            align-items: flex-end;
            flex-wrap: wrap;
            justify-content: center;
        }
        
        .form-group {
            position: relative;
        }
        
        .form-group label {
            display: block;
            text-align: left;
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
            font-weight: 500;
        }
        
        .search-form input,
        .search-form select {
            padding: 12px 16px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            font-size: 16px;
            width: 200px;
            transition: border-color 0.3s ease;
        }
        
        .search-form input:focus,
        .search-form select:focus {
            outline: none;
            border-color: #00b38a;
            box-shadow: 0 0 0 2px rgba(0, 179, 138, 0.1);
        }
        
        .search-btn {
            padding: 12px 40px;
            background-color: #00b38a;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .search-btn:hover {
            background-color: #009975;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 179, 138, 0.3);
        }
        
        /* 主容器 */
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .page-title {
            font-size: 20px;
            font-weight: 600;
            color: #333;
        }
        
        .btn-add {
            background-color: #00b38a;
            color: white;
            padding: 10px 24px;
        }
        
        .btn-add:hover {
            background-color: #009975;
        }
        
        /* 职位列表 - 卡片式布局 */
        .job-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
            gap: 20px;
        }
        
        .job-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 20px;
            transition: all 0.3s ease;
            position: relative;
        }
        
        .job-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.15);
        }
        
        .job-header {
            margin-bottom: 15px;
        }
        
        .job-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .job-salary {
            color: #ff6b00;
            font-weight: 600;
            font-size: 18px;
        }
        
        .job-company {
            font-size: 16px;
            color: #666;
            margin-bottom: 10px;
        }
        
        .job-info {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 15px;
            color: #999;
            font-size: 14px;
        }
        
        .job-info-item {
            display: flex;
            align-items: center;
        }
        
        .job-info-item i {
            margin-right: 5px;
            color: #00b38a;
        }
        
        .job-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 15px;
        }
        
        .job-tag {
            display: inline-block;
            padding: 4px 12px;
            margin-right: 8px;
            margin-bottom: 8px;
            border-radius: 4px;
            font-size: 12px;
        }
        
        .job-type-全职 {
            background-color: #f0f7f6;
            color: #00b38a;
        }
        
        .job-type-兼职 {
            background-color: #f5f0f6;
            color: #b3008a;
        }
        
        .job-type-实习 {
            background-color: #f0f3f6;
            color: #008ab3;
        }
        
        .job-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 15px;
            border-top: 1px solid #f0f0f0;
        }
        
        .job-time {
            color: #999;
            font-size: 13px;
        }
        
        .job-actions {
            display: flex;
            gap: 10px;
        }
        
        .job-actions a {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 14px;
            transition: all 0.3s;
        }
        
        .action-edit {
            color: #00b38a;
            border: 1px solid #00b38a;
        }
        
        .action-edit:hover {
            background: #00b38a;
            color: white;
        }
        
        .action-delete {
            color: #ff6b00;
            border: 1px solid #ff6b00;
        }
        
        .action-delete:hover {
            background: #ff6b00;
            color: white;
        }
        
        .action-detail {
            color: #1890ff;
            border: 1px solid #1890ff;
        }
        
        .action-detail:hover {
            background: #1890ff;
            color: white;
        }
        
        /* 空状态 */
        .empty-state {
            text-align: center;
            padding: 80px 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .empty-state-icon {
            font-size: 64px;
            color: #e0e0e0;
            margin-bottom: 20px;
        }
        
        .empty-state p {
            font-size: 18px;
            color: #999;
            margin-bottom: 30px;
        }
        
        /* 筛选区域 */
        .filter-section {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .filter-tabs {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }
        
        /* 搜索表单样式 */
        .search-conditions {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }
        
        .search-button-container {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }
        
        .filter-tab {
            padding: 6px 16px;
            background: #f5f7fa;
            border-radius: 16px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
        }
        
        .filter-tab:hover,
        .filter-tab.active {
            background: #00b38a;
            color: white;
        }
        
        /* 响应式设计 */
        @media (max-width: 768px) {
            .nav-menu {
                display: none;
            }
            
            .search-form {
                flex-direction: column;
                align-items: stretch;
            }
            
            .search-form input,
            .search-form select {
                width: 100%;
            }
            
            .search-btn {
                width: 100%;
            }
            
            .job-list {
                grid-template-columns: 1fr;
            }
            
            .page-header {
                flex-direction: column;
                gap: 15px;
                align-items: stretch;
            }
            
            .job-actions {
                flex-wrap: wrap;
            }
            
            .job-actions a {
                flex: 1;
                text-align: center;
                min-width: 60px;
            }
        }
        
        /* 动画效果 */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .fade-in {
            animation: fadeIn 0.5s ease-out;
        }
        
        /* 悬浮提示 */
        .tooltip {
            position: relative;
            display: inline-block;
        }
        
        .tooltip .tooltiptext {
            visibility: hidden;
            width: 120px;
            background-color: #555;
            color: #fff;
            text-align: center;
            border-radius: 4px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            margin-left: -60px;
            opacity: 0;
            transition: opacity 0.3s;
            font-size: 12px;
        }
        
        .user-area {
            display: flex;
            align-items: center;
            color: #333;
        }
        
        .user-info {
            background-color: #f5f5f5;
            padding: 10px 20px;
            border-radius: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .user-name {
            font-size: 18px;
            font-weight: bold;
            color: #333333;
            margin-right: 10px;
            display: block;
            text-align: center;
        }
        
        .user-detail {
            font-size: 14px;
            color: #666666;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- 顶部导航栏 -->
    <nav class="top-nav">
        <div class="nav-container">
            <a href="${pageContext.request.contextPath}/job/list" class="logo">
                <i class="fas fa-briefcase"></i> 智联招聘风格
            </a>
            <ul class="nav-menu">
                <li><a href="#">职位搜索</a></li>
                <li><a href="#">公司查询</a></li>
                <li><a href="#">求职攻略</a></li>
                <li><a href="#">薪资查询</a></li>
            </ul>
            <div class="user-area">
                <div class="user-info">
                    <span class="user-name">杨昊臻</span>
                    <span class="user-detail">石家庄铁道大学 | 学号:20234224 | 信2305-1班</span>
                </div>
            </div>
        </div>
    </nav>
    
    <!-- 搜索区域 -->
    <section class="search-section">
        <div class="search-container">
            <div class="search-tabs">
                <div class="search-tab active">全职</div>
                <div class="search-tab">兼职</div>
                <div class="search-tab">实习</div>
            </div>
            <form class="search-form" action="${pageContext.request.contextPath}/job/search" method="post">
                <div class="search-conditions">
                    <div class="form-group">
                        <label for="positionName">职位名称</label>
                        <input type="text" id="positionName" name="positionName" value="${positionName}" placeholder="职位、公司或关键词">
                    </div>
                    <div class="form-group">
                        <label for="companyName">公司名称</label>
                        <input type="text" id="companyName" name="companyName" value="${companyName}" placeholder="公司名称">
                    </div>
                    <div class="form-group">
                        <label for="location">工作地点</label>
                        <input type="text" id="location" name="location" value="${location}" placeholder="城市或区域">
                    </div>
                    <div class="form-group">
                        <label for="salary">薪资范围</label>
                        <select id="salary" name="salary">
                            <option value="">不限</option>
                            <option value="5k以下" ${salary == '5k以下' ? 'selected' : ''}>5k以下</option>
                            <option value="5k-10k" ${salary == '5k-10k' ? 'selected' : ''}>5k-10k</option>
                            <option value="10k-15k" ${salary == '10k-15k' ? 'selected' : ''}>10k-15k</option>
                            <option value="15k-20k" ${salary == '15k-20k' ? 'selected' : ''}>15k-20k</option>
                            <option value="20k-30k" ${salary == '20k-30k' ? 'selected' : ''}>20k-30k</option>
                            <option value="30k-50k" ${salary == '30k-50k' ? 'selected' : ''}>30k-50k</option>
                            <option value="50k以上" ${salary == '50k以上' ? 'selected' : ''}>50k以上</option>
                        </select>
                    </div>
                </div>
                <div class="search-button-container">
                    <button type="submit" class="search-btn">
                        <i class="fas fa-search"></i> 搜索职位
                    </button>
                </div>
            </form>
        </div>
    </section>
    
    <!-- 求职攻略区域 -->
    <div class="container" style="margin-top: 30px;">
        <div class="page-header fade-in">
            <h2 class="page-title">
                <i class="fas fa-book"></i> 求职攻略
            </h2>
        </div>
        
        <div class="job-list">
            <!-- 薪资谈判技巧 -->
            <div class="job-card fade-in">
                <div class="job-header">
                    <div class="job-title">
                        <i class="fas fa-money-bill-wave"></i> 薪资谈判技巧
                    </div>
                </div>
                <div style="color: #666; line-height: 1.8;">
                    <p><strong>1. 掌握最佳时机</strong>：终面通过后，HR明确表示录用意向时再谈薪</p>
                    <p><strong>2. 做好充分准备</strong>：提前调研行业薪资水平，明确自身市场价值</p>
                    <p><strong>3. 使用锚定效应</strong>：报出略高于预期的具体范围，如"14-16k"</p>
                    <p><strong>4. 价值量化</strong>：用数据证明自己的能力，如"提升了20%效率"</p>
                    <p><strong>5. 沉默施压法</strong>：报出期望薪资后保持33秒沉默，让HR主动让步</p>
                </div>
            </div>
            
            <!-- 简历优化指南 -->
            <div class="job-card fade-in">
                <div class="job-header">
                    <div class="job-title">
                        <i class="fas fa-file-alt"></i> 简历优化指南
                    </div>
                </div>
                <div style="color: #666; line-height: 1.8;">
                    <p><strong>1. 突出核心技能</strong>：将关键技能和项目经验放在简历前2/3位置</p>
                    <p><strong>2. 量化工作成果</strong>：使用具体数字和百分比展示成就</p>
                    <p><strong>3. 针对职位定制</strong>：根据应聘岗位调整简历重点内容</p>
                    <p><strong>4. 保持简洁明了</strong>：控制在1-2页，避免冗长描述</p>
                    <p><strong>5. 格式统一美观</strong>：使用一致的字体、间距和颜色方案</p>
                </div>
            </div>
            
            <!-- 面试准备技巧 -->
            <div class="job-card fade-in">
                <div class="job-header">
                    <div class="job-title">
                        <i class="fas fa-comments"></i> 面试准备技巧
                    </div>
                </div>
                <div style="color: #666; line-height: 1.8;">
                    <p><strong>1. 研究公司背景</strong>：了解公司业务、文化和最新动态</p>
                    <p><strong>2. 准备常见问题</strong>：练习自我介绍、职业规划等经典问题</p>
                    <p><strong>3. 模拟面试</strong>：找朋友进行模拟面试，提高表达能力</p>
                    <p><strong>4. 技术准备</strong>：复习核心知识点，准备相关项目讲解</p>
                    <p><strong>5. 关注细节</strong>：注意着装、守时和礼貌礼节</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 主内容区域 -->
    <div class="container">
        <!-- 页面头部 -->
        <div class="page-header fade-in">
            <h2 class="page-title">
                <i class="fas fa-list-ul"></i> 职位列表
            </h2>
            <a href="${pageContext.request.contextPath}/job/add" class="btn btn-add">
                <i class="fas fa-plus"></i> 添加岗位
            </a>
        </div>
        
        <!-- 筛选区域 -->
        <div class="filter-section fade-in">
            <div class="filter-tabs">
                <div class="filter-tab active">全部职位</div>
                <div class="filter-tab">最新发布</div>
                <div class="filter-tab">薪资最高</div>
                <div class="filter-tab">热门职位</div>
            </div>
        </div>
        
        <!-- 职位卡片列表 -->
        <c:choose>
            <c:when test="${not empty jobList}">
                <div class="job-list">
                    <c:forEach var="job" items="${jobList}">
                        <div class="job-card fade-in">
                            <div class="job-header">
                                <div class="job-title">
                                    ${job.positionName}
                                    <span class="job-salary">${job.salary}</span>
                                </div>
                                <div class="job-company">
                                    <i class="fas fa-building"></i> ${job.companyName}
                                </div>
                            </div>
                            <div class="job-info">
                                <div class="job-info-item">
                                    <i class="fas fa-map-marker-alt"></i> ${job.location}
                                </div>
                                <div class="job-info-item">
                                    <i class="fas fa-clock"></i> 经验不限
                                </div>
                                <div class="job-info-item">
                                    <i class="fas fa-graduation-cap"></i> 学历不限
                                </div>
                            </div>
                            <div class="job-tags">
                                <span class="job-tag job-type-${job.jobType}">${job.jobType}</span>
                                <span class="job-tag">五险一金</span>
                                <span class="job-tag">年终奖</span>
                                <span class="job-tag">弹性工作</span>
                            </div>
                            <div class="job-footer">
                                <div class="job-time">
                                    <i class="far fa-calendar-alt"></i> ${job.postTime}
                                </div>
                                <div class="job-actions">
                                    <a href="${pageContext.request.contextPath}/job/edit?id=${job.id}" class="action-edit tooltip">
                                        <i class="fas fa-edit"></i>
                                        <span class="tooltiptext">编辑</span>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/job/delete?id=${job.id}" class="action-delete tooltip" onclick="return confirm('确定要删除这条岗位信息吗？')">
                                        <i class="fas fa-trash-alt"></i>
                                        <span class="tooltiptext">删除</span>
                                    </a>
                                    <a href="#" class="action-detail tooltip" onclick="showDetails(${job.id}, event); event.preventDefault();">
                                        <i class="fas fa-eye"></i>
                                        <span class="tooltiptext">详情</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state fade-in">
                    <div class="empty-state-icon">
                        <i class="far fa-frown"></i>
                    </div>
                    <p>抱歉，没有找到符合条件的职位</p>
                    <a href="${pageContext.request.contextPath}/job/add" class="btn btn-primary">
                        <i class="fas fa-plus"></i> 添加第一个岗位
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script>
        // 显示职位详情
        function showDetails(jobId) {
            // 获取点击的元素
            const clickedElement = event.target;
            // 确保jobCard存在
            const jobCard = clickedElement.closest('.job-card');
            if (!jobCard) {
                console.error('未找到职位卡片元素');
                return;
            }
            // 模拟异步加载职位详情
            setTimeout(() => {
                const jobCard = clickedElement.closest('.job-card');
                const positionName = jobCard.querySelector('.job-title').textContent.trim().split('\n')[0];
                const salary = jobCard.querySelector('.job-salary').textContent;
                const companyName = jobCard.querySelector('.job-company').textContent.replace('🏢 ', '');
                const location = jobCard.querySelector('.job-info-item:first-child').textContent.replace('📍 ', '');
                const postTime = jobCard.querySelector('.job-time').textContent.replace('📅 ', '');
                
                // 创建详情弹窗
                const modal = document.createElement('div');
                modal.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0,0,0,0.5);
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    z-index: 2000;
                    animation: fadeIn 0.3s ease-out;
                `;
                
                const modalContent = document.createElement('div');
                modalContent.style.cssText = `
                    background: white;
                    border-radius: 8px;
                    padding: 30px;
                    max-width: 600px;
                    width: 90%;
                    max-height: 80vh;
                    overflow-y: auto;
                    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
                    animation: slideIn 0.3s ease-out;
                `;
                
                modalContent.innerHTML = `
                    <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 20px;">
                        <div>
                            <h3 style="font-size: 24px; color: #333; margin-bottom: 10px;">${positionName}</h3>
                            <p style="font-size: 20px; color: #ff6b00; font-weight: 600; margin-bottom: 10px;">${salary}</p>
                            <div style="display: flex; gap: 20px; color: #666;">
                                <span><i class="fas fa-building"></i> ${companyName}</span>
                                <span><i class="fas fa-map-marker-alt"></i> ${location}</span>
                            </div>
                        </div>
                        <button id="closeModal" style="background: none; border: none; font-size: 24px; cursor: pointer; color: #999;">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <div style="border-top: 1px solid #f0f0f0; padding-top: 20px; margin-bottom: 20px;">
                        <h4 style="font-size: 16px; color: #333; margin-bottom: 10px;">职位描述</h4>
                        <p style="color: #666; line-height: 1.8;">该职位是一个重要的工作岗位，负责相关技术工作，需要具备良好的专业技能和团队协作能力。</p>
                    </div>
                    <div style="border-top: 1px solid #f0f0f0; padding-top: 20px; margin-bottom: 20px;">
                        <h4 style="font-size: 16px; color: #333; margin-bottom: 10px;">任职要求</h4>
                        <ul style="color: #666; line-height: 1.8; list-style-position: inside;">
                            <li>相关专业背景</li>
                            <li>具备良好的沟通能力</li>
                            <li>有团队协作精神</li>
                            <li>能够承受一定的工作压力</li>
                        </ul>
                    </div>
                    <div style="text-align: right; border-top: 1px solid #f0f0f0; padding-top: 20px;">
                        <button id="closeBtn" class="btn" style="background: #f5f5f5; color: #333; margin-right: 10px;">关闭</button>
                        <a href="${pageContext.request.contextPath}/job/edit?id=${jobId}" class="btn btn-primary">编辑职位</a>
                    </div>
                `;
                
                modal.appendChild(modalContent);
                document.body.appendChild(modal);
                
                // 添加动画样式
                const style = document.createElement('style');
                style.textContent = `
                    @keyframes slideIn {
                        from {
                            opacity: 0;
                            transform: translateY(-20px);
                        }
                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }
                `;
                document.head.appendChild(style);
                
                // 关闭按钮事件
                document.getElementById('closeModal').onclick = closeModal;
                document.getElementById('closeBtn').onclick = closeModal;
                
                function closeModal() {
                    modal.style.opacity = '0';
                    setTimeout(() => {
                        document.body.removeChild(modal);
                        document.head.removeChild(style);
                    }, 300);
                }
                
                // 点击外部关闭
                modal.onclick = function(event) {
                    if (event.target === modal) {
                        closeModal();
                    }
                };
            }, 100);
        }
        
        // 为元素添加淡入动画
        document.addEventListener('DOMContentLoaded', function() {
            const fadeElements = document.querySelectorAll('.fade-in');
            fadeElements.forEach((el, index) => {
                el.style.opacity = '0';
                setTimeout(() => {
                    el.style.opacity = '1';
                }, 100 * index);
            });
            
            // 搜索标签切换
        const searchTabs = document.querySelectorAll('.search-tab');
        searchTabs.forEach(tab => {
            tab.addEventListener('click', function() {
                searchTabs.forEach(t => t.classList.remove('active'));
                this.classList.add('active');
                
                // 创建隐藏字段来存储职位类型
                let jobTypeInput = document.querySelector('input[name="jobType"]');
                if (!jobTypeInput) {
                    jobTypeInput = document.createElement('input');
                    jobTypeInput.type = 'hidden';
                    jobTypeInput.name = 'jobType';
                    document.querySelector('.search-form').appendChild(jobTypeInput);
                }
                
                // 设置职位类型值
                jobTypeInput.value = this.textContent.trim();
            });
        });
        
        // 页面加载时，默认选中全职并设置职位类型
        document.addEventListener('DOMContentLoaded', function() {
            const activeTab = document.querySelector('.search-tab.active');
            if (activeTab) {
                let jobTypeInput = document.querySelector('input[name="jobType"]');
                if (!jobTypeInput) {
                    jobTypeInput = document.createElement('input');
                    jobTypeInput.type = 'hidden';
                    jobTypeInput.name = 'jobType';
                    document.querySelector('.search-form').appendChild(jobTypeInput);
                }
                jobTypeInput.value = activeTab.textContent.trim();
            }
        });
        
        // 筛选标签切换
            const filterTabs = document.querySelectorAll('.filter-tab');
            filterTabs.forEach(tab => {
                tab.addEventListener('click', function() {
                    filterTabs.forEach(t => t.classList.remove('active'));
                    this.classList.add('active');
                });
            });
        });
    </script>
</body>
</html>