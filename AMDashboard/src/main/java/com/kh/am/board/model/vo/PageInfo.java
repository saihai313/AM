package com.kh.am.board.model.vo;

public class PageInfo {

    private int currentPage;    //현재 페이지 번호
    private int listCount; //전체게시글 수
    private int limit=10; //한페이제 보여질 게시글 수 ,명시적 초기화 
    private int pagingBarSize=10;// 보여질 페이징바 페이지수
    
    private int maxPage; //전체 페이지수(==가장 마지막 페이지)
    private int startPage;//페이징바 시작 페이지 번호
    
    private int endPage; //페이징바 끝 페이지 번호
    
    private int boardType; //게시글 타입 
    
    public PageInfo() {
    }

    public PageInfo(int currentPage, int listCount, int limit, int pagingBarSize, int maxPage, int startPage,
            int endPage, int boardType) {
        super();
        this.currentPage = currentPage;
        this.listCount = listCount;
        this.limit = limit;
        this.pagingBarSize = pagingBarSize;
        this.maxPage = maxPage;
        this.startPage = startPage;
        this.endPage = endPage;
        this.boardType = boardType;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getListCount() {
        return listCount;
    }

    public void setListCount(int listCount) {
        this.listCount = listCount;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getPagingBarSize() {
        return pagingBarSize;
    }

    public void setPagingBarSize(int pagingBarSize) {
        this.pagingBarSize = pagingBarSize;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getBoardType() {
        return boardType;
    }

    public void setBoardType(int boardType) {
        this.boardType = boardType;
    }

    @Override
    public String toString() {
        return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
                + ", pagingBarSize=" + pagingBarSize + ", maxPage=" + maxPage + ", startPage=" + startPage
                + ", endPage=" + endPage + ", boardType=" + boardType + "]";
    }

    
    
    
}
