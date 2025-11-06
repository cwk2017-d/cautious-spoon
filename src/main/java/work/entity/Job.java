package work.entity;

import java.io.Serializable;

public class Job implements Serializable {
    private Integer id;
    private String companyName;
    private String positionName;
    private String salary;
    private String requirements;
    private String location;
    private String postTime;
    private String jobType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }
    
    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", companyName='" + companyName + '\'' +
                ", positionName='" + positionName + '\'' +
                ", salary='" + salary + '\'' +
                ", requirements='" + requirements + '\'' +
                ", location='" + location + '\'' +
                ", postTime='" + postTime + '\'' +
                ", jobType='" + jobType + '\'' +
                '}';
    }
}