package chzu.performance.entity;

import java.util.Date;

public class Performance {
    private Integer id;

    private String pName;

    private Integer uId;

    private Integer pType;

    private Date pDate;

    private Integer pScore;

    private Integer pDepart;

    private Integer deptExam;

    private Integer acaExam;

    private String schoolyear;

    private String pTerm;

    private Integer pLab;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getpType() {
        return pType;
    }

    public void setpType(Integer pType) {
        this.pType = pType;
    }

    public Date getpDate() {
        return pDate;
    }

    public void setpDate(Date pDate) {
        this.pDate = pDate;
    }

    public Integer getpScore() {
        return pScore;
    }

    public void setpScore(Integer pScore) {
        this.pScore = pScore;
    }

    public Integer getpDepart() {
        return pDepart;
    }

    public void setpDepart(Integer pDepart) {
        this.pDepart = pDepart;
    }

    public Integer getDeptExam() {
        return deptExam;
    }

    public void setDeptExam(Integer deptExam) {
        this.deptExam = deptExam;
    }

    public Integer getAcaExam() {
        return acaExam;
    }

    public void setAcaExam(Integer acaExam) {
        this.acaExam = acaExam;
    }

    public String getSchoolyear() {
        return schoolyear;
    }

    public void setSchoolyear(String schoolyear) {
        this.schoolyear = schoolyear == null ? null : schoolyear.trim();
    }

    public String getpTerm() {
        return pTerm;
    }

    public void setpTerm(String pTerm) {
        this.pTerm = pTerm == null ? null : pTerm.trim();
    }

    public Integer getpLab() {
        return pLab;
    }

    public void setpLab(Integer pLab) {
        this.pLab = pLab;
    }
}