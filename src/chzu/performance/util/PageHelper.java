package chzu.performance.util;

import java.io.Serializable;

public class PageHelper implements Serializable{
	private static final long serialVersionUID = 6810995231876973250L;
	private String pagec;
	private PageContext page;
	private String pageSize;
	private String totalPages;
	private String totalRows;

	public PageHelper(String pagec, String pageSize, String totalPages,
			String totalRows) {
		 page = PageContext.getContext();
		if (null == pagec) {
			page.setCurrentPage(1);
			page.setPageSize(10);
		} else {
			page.setCurrentPage(Integer.parseInt(pagec));
			page.setPageSize(Integer.parseInt(pageSize));
			page.setTotalPages(Integer.parseInt(totalPages));
			page.setTotalRows(Integer.parseInt(totalRows));
		}
		page.setPagination(true);
	}

	public String getPagec() {
		return pagec;
	}

	public void setPagec(String pagec) {
		this.pagec = pagec;
	}

	public PageContext getPage() {
		return page;
	}

	public void setPage(PageContext page) {
		this.page = page;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(String totalPages) {
		this.totalPages = totalPages;
	}

	public String getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(String totalRows) {
		this.totalRows = totalRows;
	}
}
