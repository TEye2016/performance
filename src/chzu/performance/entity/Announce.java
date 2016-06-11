package chzu.performance.entity;

import java.util.Date;

public class Announce {
    private Integer id;

    private Integer userid;

    private Date aDate;

    private Date aEnd;

    private String aName;

    private Integer aScore;

    private Integer aLab;

    private String aTerm;

    private String aSchoolyear;

    private String aDetail;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getaDate() {
        return aDate;
    }

    public void setaDate(Date aDate) {
        this.aDate = aDate;
    }

    public Date getaEnd() {
        return aEnd;
    }

    public void setaEnd(Date aEnd) {
        this.aEnd = aEnd;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName == null ? null : aName.trim();
    }

    public Integer getaScore() {
        return aScore;
    }

    public void setaScore(Integer aScore) {
        this.aScore = aScore;
    }

    public Integer getaLab() {
        return aLab;
    }

    public void setaLab(Integer aLab) {
        this.aLab = aLab;
    }

    public String getaTerm() {
        return aTerm;
    }

    public void setaTerm(String aTerm) {
        this.aTerm = aTerm == null ? null : aTerm.trim();
    }

    public String getaSchoolyear() {
        return aSchoolyear;
    }

    public void setaSchoolyear(String aSchoolyear) {
        this.aSchoolyear = aSchoolyear == null ? null : aSchoolyear.trim();
    }

    public String getaDetail() {
        return aDetail;
    }

    public void setaDetail(String aDetail) {
        this.aDetail = aDetail == null ? null : aDetail.trim();
    }
}