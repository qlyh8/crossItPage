package crossit.gandhi.util;
  
import org.apache.commons.lang3.StringUtils;  
import org.slf4j.*;
 

public class PageNavigation {
	    
	private transient final Logger logger = LoggerFactory.getLogger(getClass());
	
	int perPage = 10;
	int listPage = 10;		//(<< < 1 2 3 4 5 6 7 8 9 10 > >>)

	int currentPage= 0 ;		
	int startRow= 0 ;		
	int endRow= 0 ;			
	int totalCount = 0; 	
	int totalPage = 0 ;
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public PageNavigation(int currentPage){
		init(currentPage);  
	}
	
	public PageNavigation(int perPage , int listPage , int currentPage){
		this.perPage = perPage ;
		this.listPage = listPage ;
		init(currentPage);  
	}
	
	private void init(int currentPage){
		this.currentPage = currentPage; 

		startRow =  (currentPage-1)*perPage ; 
		endRow = currentPage*perPage ; 
	}
	 
	/**
	 * @param firstHtml
	 * @param prevHtml
	 * @param nowHtml
	 * @param pageHtml
	 * @param nextHtml
	 * @param lastHtml
	 * @return
	 */
	public String getPageHtml(String firstHtml , String prevHtml , String nowHtml , String pageHtml  , String nextHtml , String lastHtml) {   
		
		if(totalCount == 0) return "";

		 StringBuffer buffer= new StringBuffer();
		  
		int currentFirst = (currentPage-1)/listPage;		
			currentFirst = currentFirst * listPage + 1;
		int currentlast = (currentPage-1)/listPage;		
			currentlast = currentlast * listPage + listPage;
		int nextFirst = (currentPage-1)/listPage;			
			nextFirst = (nextFirst+1) * listPage + 1; 
		int prevLast = (currentPage-1)/listPage;			
			prevLast = (prevLast-1) * listPage + listPage ;
		int lastPage = 1;											
			lastPage = totalCount / perPage;
		if ( totalCount%perPage != 0 ) lastPage = lastPage + 1;
			currentlast = (currentlast>lastPage)?lastPage:currentlast;
		 
			
		if ( currentPage>1 ) {
			//buffer.append( "<a href=\"javascript:changePage('1');\" title='처음 ?��?���?'><img src='/images/arrow_first.gif' /></a>\r\n" );
			buffer.append( firstHtml );
		}
		
		
		if ( prevLast > 0 ) {
			//buffer.append( "<a href=\"javascript:changePage('"+prevLast+"');\" title='?��?�� 10?��?���?'><img src='/images/common/pg_prev.gif'  /></a>\r\n" );
			buffer.append( StringUtils.replace(prevHtml,"#", String.valueOf(prevLast)));
		} 
									 
		for (int j=currentFirst; j<currentFirst+listPage && j<=lastPage; j++) {	
			if ( j <= currentlast ) {
				if ( j == currentPage ) {
					//buffer.append("<strong>"+j+"</strong>\r\n");
					buffer.append( StringUtils.replace(nowHtml,"#", String.valueOf(j)));
				} else {
					//buffer.append("<a href=\"javascript:changePage('"+j+"');\" >"+j+"</a>\r\n" );
					buffer.append( StringUtils.replace(pageHtml,"#", String.valueOf(j)));
				}
			} 
		}

		if ( nextFirst > lastPage ) {   nextFirst = lastPage ;  }
		//@@@if ( nextFirst <= lastPage ) {
		if(currentlast < totalPage) {
			//buffer.append( "<a href=\"javascript:changePage('"+nextFirst+"');\" title='?��?�� 10?��?���?' ><img src='/images/common/pg_next.gif' /></a>\r\n" );
			buffer.append( StringUtils.replace(nextHtml,"#", String.valueOf(nextFirst)));
		}
		
		if ( currentPage < lastPage ) {
			//buffer.append( "<a href=\"javascript:changePage('"+lastPage+"');\" title='마�?�? ?��?���?'><img src='/images/arrow_last.gif' /></a>\r\n" ) ;
			buffer.append( StringUtils.replace(lastHtml,"#", String.valueOf(lastPage)));
		}	

		return buffer.toString() ;
	}
	
	/**
	 * @param firstHtml
	 * @param prevHtml
	 * @param nowHtml
	 * @param pageHtml
	 * @param nextHtml
	 * @param lastHtml
	 * @return
	 */
	public String getPageHtml2(String firstHtml , String prevHtml , String nowHtml , String pageHtml  , String nextHtml , String lastHtml) {   
		
		if(totalCount == 0) return "";

		 StringBuffer buffer= new StringBuffer();
		  
		int currentFirst = (currentPage-1)/listPage;		
			currentFirst = currentFirst * listPage + 1;
		int currentlast = (currentPage-1)/listPage;		
			currentlast = currentlast * listPage + listPage;
		int nextFirst = (currentPage-1)/listPage;			
			nextFirst = (nextFirst+1) * listPage + 1; 
		int prevLast = (currentPage-1)/listPage;			
			prevLast = (prevLast-1) * listPage + listPage ;
		int lastPage = 1;											
			lastPage = totalCount / perPage;
		if ( totalCount%perPage != 0 ) lastPage = lastPage + 1;
			currentlast = (currentlast>lastPage)?lastPage:currentlast;
		 
		buffer.append("<span class=\"num\">");
		
		if ( currentPage>1 ) {
			//buffer.append( "<a href=\"javascript:changePage('1');\" title='처음 ?��?���?'><img src='/images/arrow_first.gif' /></a>\r\n" );
			buffer.append( firstHtml );
		}
		
		
		if ( prevLast > 0 ) {
			//buffer.append( "<a href=\"javascript:changePage('"+prevLast+"');\" title='?��?�� 10?��?���?'><img src='/images/common/pg_prev.gif'  /></a>\r\n" );
			buffer.append( StringUtils.replace(prevHtml,"#", String.valueOf(prevLast)));
		} 
									 
		for (int j=currentFirst; j<currentFirst+listPage && j<=lastPage; j++) {	
			if ( j <= currentlast ) {
				if ( j == currentPage ) {
					//buffer.append("<strong>"+j+"</strong>\r\n");
					buffer.append( StringUtils.replace(nowHtml,"#", String.valueOf(j)));
				} else {
					//buffer.append("<a href=\"javascript:changePage('"+j+"');\" >"+j+"</a>\r\n" );
					buffer.append( StringUtils.replace(pageHtml,"#", String.valueOf(j)));
				}
			} 
		}

		if ( nextFirst > lastPage ) {   nextFirst = lastPage ;  }
		//@@@if ( nextFirst <= lastPage ) {
		if(currentlast < totalPage) {
			//buffer.append( "<a href=\"javascript:changePage('"+nextFirst+"');\" title='?��?�� 10?��?���?' ><img src='/images/common/pg_next.gif' /></a>\r\n" );
			buffer.append( StringUtils.replace(nextHtml,"#", String.valueOf(nextFirst)));
		}
		
		if ( currentPage < lastPage ) {
			//buffer.append( "<a href=\"javascript:changePage('"+lastPage+"');\" title='마�?�? ?��?���?'><img src='/images/arrow_last.gif' /></a>\r\n" ) ;
			buffer.append( StringUtils.replace(lastHtml,"#", String.valueOf(lastPage)));
		}	
		
		buffer.append("</span>");

		return buffer.toString() ;
	}
	
	public int getStartRow() {
		return startRow;
	} 

	public int getEndRow() {
		return endRow;
	} 
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount; 

		totalPage = totalCount / perPage; 
	
		if ( totalCount%perPage != 0 ) 
			totalPage = totalPage + 1; 

	}
	
	
	//게시물의 ?��?�� 게시 번호
	public int getListIndex(int index) {
		return totalCount - perPage*(currentPage-1) - index ;
	}
	
	public static void main(String [] args){
		/*
		PageNavigation pageNavigation = new PageNavigation(139);
		pageNavigation.setTotalCount( 1384 ); 
 
		String firstHtml = "<a href=\"javascript:changePage('1');\" title='처음 ?��?���?'><img src='/sc/images/arrow_first.gif' /></a>\r\n"  ;
		String prevHtml = "<a href=\"javascript:changePage('#');\" title='?��?�� 10?��?���?'><img src='/sc/images/common/pg_prev.gif'  /></a>\r\n" ;
		String nowHtml = "<strong>#</strong>\r\n" ;
		String pageHtml = "<a href=\"javascript:changePage('#');\" >#</a>\r\n" ;
		String nextHtml = "<a href=\"javascript:changePage('#');\" title='?��?�� 10?��?���?' ><img src='/sc/images/common/pg_next.gif' /></a>\r\n" ;
		String lastHtml = "<a href=\"javascript:changePage('#');\" title='마�?�? ?��?���?'><img src='/sc/images/arrow_last.gif' /></a>\r\n" ;
		
		System.out.print( pageNavigation.getPageHtml(firstHtml , prevHtml , nowHtml , pageHtml  , nextHtml , lastHtml) ) ;
		*/
	}
}
