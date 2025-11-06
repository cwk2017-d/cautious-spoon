package work.controller;

import work.entity.Job;
import work.service.JobService;
import work.service.impl.JobServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/job/*")
public class JobController extends HttpServlet {
    private JobService jobService = new JobServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null) {
            pathInfo = "/";
        }

        switch (pathInfo) {
            case "/list":
                showJobList(request, response);
                break;
            case "/add":
                showAddJobForm(request, response);
                break;
            case "/edit":
                showEditJobForm(request, response);
                break;
            case "/delete":
                deleteJob(request, response);
                break;
            case "/search":
                searchJobs(request, response);
                break;
            default:
                showJobList(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pathInfo = request.getPathInfo();
        if (pathInfo == null) {
            pathInfo = "/";
        }

        switch (pathInfo) {
            case "/add":
                addJob(request, response);
                break;
            case "/update":
                updateJob(request, response);
                break;
            case "/search":
                searchJobs(request, response);
                break;
            default:
                showJobList(request, response);
                break;
        }
    }

    // 显示岗位列表
    private void showJobList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Job> jobList = jobService.getAllJobs();
        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("/WEB-INF/views/jobList.jsp").forward(request, response);
    }

    // 显示添加岗位表单
    private void showAddJobForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/addJob.jsp").forward(request, response);
    }

    // 添加岗位
    private void addJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Job job = new Job();
        job.setCompanyName(request.getParameter("companyName"));
        job.setPositionName(request.getParameter("positionName"));
        job.setSalary(request.getParameter("salary"));
        job.setRequirements(request.getParameter("requirements"));
        job.setLocation(request.getParameter("location"));
        job.setJobType(request.getParameter("jobType"));
        job.setPostTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

        boolean success = jobService.addJob(job);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/job/list");
        } else {
            request.setAttribute("errorMsg", "添加失败，请重试");
            request.getRequestDispatcher("/WEB-INF/views/addJob.jsp").forward(request, response);
        }
    }

    // 显示编辑岗位表单
    private void showEditJobForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                Integer id = Integer.parseInt(idStr);
                Job job = jobService.getJobById(id);
                if (job != null) {
                    request.setAttribute("job", job);
                    request.getRequestDispatcher("/WEB-INF/views/editJob.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "/job/list");
    }

    // 更新岗位信息
    private void updateJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                Integer id = Integer.parseInt(idStr);
                Job job = new Job();
                job.setId(id);
                job.setCompanyName(request.getParameter("companyName"));
                job.setPositionName(request.getParameter("positionName"));
                job.setSalary(request.getParameter("salary"));
                job.setRequirements(request.getParameter("requirements"));
                job.setLocation(request.getParameter("location"));
                job.setJobType(request.getParameter("jobType"));
                job.setPostTime(request.getParameter("postTime"));

                boolean success = jobService.updateJob(job);
                if (success) {
                    response.sendRedirect(request.getContextPath() + "/job/list");
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("errorMsg", "更新失败，请重试");
        showEditJobForm(request, response);
    }

    // 删除岗位
    private void deleteJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                Integer id = Integer.parseInt(idStr);
                jobService.deleteJob(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "/job/list");
    }

    // 搜索岗位
    private void searchJobs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyName = request.getParameter("companyName");
        String positionName = request.getParameter("positionName");
        String salary = request.getParameter("salary");
        String location = request.getParameter("location");
        String jobType = request.getParameter("jobType");

        Map<String, Object> condition = new HashMap<>();
        condition.put("companyName", companyName);
        condition.put("positionName", positionName);
        condition.put("salary", salary);
        condition.put("location", location);
        condition.put("jobType", jobType);

        List<Job> jobList = jobService.searchJobs(condition);
        request.setAttribute("jobList", jobList);
        request.setAttribute("companyName", companyName);
        request.setAttribute("positionName", positionName);
        request.setAttribute("salary", salary);
        request.setAttribute("location", location);
        request.setAttribute("jobType", jobType);
        request.getRequestDispatcher("/WEB-INF/views/jobList.jsp").forward(request, response);
    }
}