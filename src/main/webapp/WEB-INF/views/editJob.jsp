<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>编辑岗位 - 智联招聘风格</title>
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
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
        }
        
        .btn-primary {
            background-color: #00b38a;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #009975;
        }
        
        /* 主容器 */
        .container {
            max-width: 800px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        /* 表单容器 */
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease;
        }
        
        .form-container:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-header h2 {
            color: #1f2937;
            font-size: 1.8rem;
            font-weight: 600;
        }
        
        /* 表单组 */
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }
        
        .radio-item {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            padding: 8px 15px;
            border: 1px solid #d9d9d9;
            border-radius: 4px;
            transition: all 0.3s;
        }
        
        .radio-item:hover {
            border-color: #00b38a;
        }
        
        .radio-item input[type="radio"] {
            cursor: pointer;
        }
        
        .radio-item input[type="radio"]:checked + span {
            color: #00b38a;
            font-weight: 500;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-weight: 500;
            font-size: 15px;
        }
        
        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group textarea {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #fff;
        }
        
        .form-group input[type="text"]:focus,
        .form-group input[type="date"]:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #00b38a;
            box-shadow: 0 0 0 2px rgba(0, 179, 138, 0.1);
        }
        
        .form-group textarea {
            min-height: 120px;
            resize: vertical;
        }
        
        .form-group input::placeholder {
            color: #999;
        }
        
        .form-group input[type="hidden"] {
            display: none;
        }
        
        .form-group input::placeholder {
            color: #9ca3af;
        }
        
        /* 按钮样式 */
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
        
        .btn-submit {
            background-color: #00b38a;
            color: white;
            padding: 12px 36px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 4px;
        }
        
        .btn-submit:hover {
            background-color: #009975;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 179, 138, 0.3);
        }
        
        .btn-back {
            background-color: #f5f5f5;
            color: #333;
            padding: 12px 36px;
            font-size: 16px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            margin-left: 12px;
        }
        
        .btn-back:hover {
            background-color: #e8e8e8;
        }
        
        /* 按钮组 */
        .form-actions {
            display: flex;
            justify-content: flex-end;
            margin-top: 40px;
            gap: 20px;
            padding-top: 20px;
            border-top: 1px solid #f0f0f0;
        }
        
        /* 错误消息 */
        .error-message {
            color: #ef4444;
            margin-top: 8px;
            font-size: 14px;
            position: absolute;
            bottom: -24px;
            left: 0;
        }
        
        /* 必填标记 */
        .required {
            color: #ef4444;
            margin-left: 4px;
        }
        
        /* 响应式设计 */
        @media (max-width: 768px) {
            .button-group {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                margin-left: 0;
            }
            
            .btn-back {
                margin-left: 0;
                margin-top: 12px;
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
        
        /* 表单提示 */
        .form-tips {
            background-color: #f0fdf4;
            border-left: 4px solid #00b38a;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 0 4px 4px 0;
            font-size: 14px;
            color: #166534;
        }
        
        .form-tips i {
            margin-right: 8px;
            color: #00b38a;
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
            <!-- 登录注册功能已移除 -->
        </div>
        </div>
    </nav>
    
    <div class="container">
        <div class="form-container fade-in">
            <div class="form-header">
                <h2><i class="fas fa-edit"></i> 编辑岗位信息</h2>
            </div>
            
            <div class="form-tips">
                <i class="fas fa-lightbulb"></i> 请填写完整的岗位信息，带 <span style="color: #ff4d4f;">*</span> 的字段为必填项
            </div>
            
            <c:if test="${not empty job}">
                <form action="${pageContext.request.contextPath}/job/update" method="post" onsubmit="return validateForm()">
                    <input type="hidden" name="id" value="${job.id}">
                    
                    <div class="form-group fade-in">
                        <label for="companyName">企业名称 <span class="required">*</span></label>
                        <input type="text" id="companyName" name="companyName" value="${job.companyName}" required placeholder="请输入企业全称">
                    </div>
                    
                    <div class="form-group fade-in">
                        <label for="positionName">岗位名称 <span class="required">*</span></label>
                        <input type="text" id="positionName" name="positionName" value="${job.positionName}" required placeholder="请输入岗位名称">
                    </div>
                    
                    <div class="form-group fade-in">
                        <label for="salary">薪资 <span class="required">*</span></label>
                        <input type="text" id="salary" name="salary" value="${job.salary}" required placeholder="如：15k-25k">
                    </div>
                    
                    <div class="form-group fade-in">
                        <label for="location">工作地点 <span class="required">*</span></label>
                        <input type="text" id="location" name="location" value="${job.location}" required placeholder="如：北京朝阳区">
                    </div>
                    
                    <div class="form-group fade-in">
                        <label for="jobType">职位类型 <span class="required">*</span></label>
                        <div class="radio-group">
                            <label class="radio-item">
                                <input type="radio" name="jobType" value="全职" ${job.jobType == '全职' ? 'checked' : ''} required> 全职
                            </label>
                            <label class="radio-item">
                                <input type="radio" name="jobType" value="兼职" ${job.jobType == '兼职' ? 'checked' : ''}> 兼职
                            </label>
                            <label class="radio-item">
                                <input type="radio" name="jobType" value="实习" ${job.jobType == '实习' ? 'checked' : ''}> 实习
                            </label>
                        </div>
                    </div>
                    
                    <div class="form-group fade-in">
                        <label for="requirements">岗位要求 <span class="required">*</span></label>
                        <textarea id="requirements" name="requirements" required placeholder="请输入岗位的具体要求，如技能要求、工作经验等">${job.requirements}</textarea>
                    </div>
                    
                    <div class="form-group fade-in">
                        <label for="postTime">发布时间</label>
                        <input type="date" id="postTime" name="postTime" value="${job.postTime}">
                    </div>
                    
                    <div class="form-actions">
                        <button type="submit" class="btn btn-submit">更新岗位</button>
                        <a href="${pageContext.request.contextPath}/job/list" class="btn btn-back">返回列表</a>
                    </div>
                    

                </form>
            </c:if>
            

        </div>
    </div>

    <script>
        // 添加表单元素的动画延迟
        document.addEventListener('DOMContentLoaded', function() {
            const formGroups = document.querySelectorAll('.form-group');
            formGroups.forEach((group, index) => {
                group.style.animationDelay = (index * 0.1) + 's';
            });
        });
        
        // 表单验证函数
        function validateForm() {
            const companyName = document.getElementById('companyName')?.value.trim();
            const positionName = document.getElementById('positionName')?.value.trim();
            const salary = document.getElementById('salary')?.value.trim();
            const location = document.getElementById('location')?.value.trim();
            const requirements = document.getElementById('requirements')?.value.trim();
            
            // 基本验证
            if (!companyName) {
                alert('请输入企业名称');
                document.getElementById('companyName')?.focus();
                return false;
            }
            
            if (!positionName) {
                alert('请输入岗位名称');
                document.getElementById('positionName')?.focus();
                return false;
            }
            
            if (!salary) {
                alert('请输入薪资信息');
                document.getElementById('salary')?.focus();
                return false;
            }
            
            if (!location) {
                alert('请输入工作地点');
                document.getElementById('location')?.focus();
                return false;
            }
            
            if (!requirements) {
                alert('请输入岗位要求');
                document.getElementById('requirements')?.focus();
                return false;
            }
            
            // 薪资格式验证（简单的格式检查）
            const salaryPattern = /^[0-9]+k(-[0-9]+k)?$/;
            if (!salaryPattern.test(salary) && !salary.includes('元')) {
                if (!confirm('薪资格式可能不正确，建议使用"数字k"或"数字-数字k"格式。是否继续提交？')) {
                    document.getElementById('salary')?.focus();
                    return false;
                }
            }
            
            return true;
        }
        
        // 为输入框添加输入时的视觉反馈
        const inputs = document.querySelectorAll('input, textarea');
        inputs.forEach(input => {
            input.addEventListener('input', function() {
                if (this.value.trim()) {
                    this.style.borderColor = '#2563eb';
                } else {
                    this.style.borderColor = '#e5e7eb';
                }
            });
            
            // 页面加载时检查输入框是否有内容
            if (input.value.trim()) {
                input.style.borderColor = '#2563eb';
            }
        });
    </script>
</body>
</html>