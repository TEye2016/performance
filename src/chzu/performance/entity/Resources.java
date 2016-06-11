package chzu.performance.entity;

import java.util.HashSet;
import java.util.Set;
public class Resources {
    private Integer id;

    private String name;

    private Integer parentid;

    private String reskey;

    private String type;
    private String resurl;
    private Integer level;
    private String description;
    private Set<Role> roles = new HashSet<Role>(0);
	private Set<Resources> childs = new HashSet<Resources>(0);
	private Integer parentId; //父类Id
	private String parentName;
    public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<Resources> getChilds() {
		return childs;
	}

	public void setChilds(Set<Resources> childs) {
		this.childs = childs;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getReskey() {
        return reskey;
    }

    public void setReskey(String reskey) {
        this.reskey = reskey == null ? null : reskey.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getResurl() {
        return resurl;
    }

    public void setResurl(String resurl) {
        this.resurl = resurl == null ? null : resurl.trim();
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}