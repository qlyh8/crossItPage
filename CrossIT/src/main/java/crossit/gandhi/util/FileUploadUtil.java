package crossit.gandhi.util;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.*;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import java.text.SimpleDateFormat;



public class FileUploadUtil {
	
	int maxSize  = 1024*1024*10;       
 
    private String savePath = "";
 
    // 업로드 파일명
    private String uploadFile = "";
 
    // 실제 저장할 파일명
    private String newFileName = "";
 
    // 업로드 제한 확장자명
    private String[] allowFileExt;

    private MultipartRequest multi;
    
    int read = 0;
    byte[] buf = new byte[1024];
    FileInputStream fin = null;
    FileOutputStream fout = null;
    long currentTime = System.currentTimeMillis(); 
    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss"); 
    
    
    public FileUploadUtil(HttpServletRequest request, String FileUploadPath, String[] allowFileExt){
    	this.savePath = FileUploadPath;
    	this.allowFileExt = allowFileExt;
    	
    	try {
			this.multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    
    public boolean upload(String paramName){
    	
    	boolean result = false;
    	
    	try{
    		 
     
            // 파일업로드
            uploadFile = StringUtils.defaultIfBlank(multi.getFilesystemName(paramName), "");
            System.out.println("~~~!uploadFile"+uploadFile+"%%%%");
            if(uploadFile.equals("") || uploadFile == null){
            	System.out.println("~~~!");
            	savePath = "";
            	return true;
            }
            
            if(!checkFileExt( uploadFile.substring(uploadFile.lastIndexOf(".")+1))){
				throw new Exception("업로드 할 수 없는 파일 확장자입니다.");
			}
     
            // 실제 저장할 파일명(ex : 20140819151221.zip)
            newFileName = simDf.format(new Date(currentTime)) +"."+ uploadFile.substring(uploadFile.lastIndexOf(".")+1);
     
            System.out.println(savePath + "/" + uploadFile);
            System.out.println(savePath + "/" + newFileName);
             
            // 업로드된 파일 객체 생성
            File oldFile = new File(savePath + "/" + uploadFile);
     
             
            // 실제 저장될 파일 객체 생성
            File newFile = new File(savePath + "/" + newFileName);
             
     
            // 파일명 rename
            if(!oldFile.renameTo(newFile)){
     
                // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
     
                buf = new byte[1024];
                fin = new FileInputStream(oldFile);
                fout = new FileOutputStream(newFile);
                read = 0;
                while((read=fin.read(buf,0,buf.length))!=-1){
                    fout.write(buf, 0, read);
                }
                 
                fin.close();
                fout.close();
                oldFile.delete();
            }  
            
            result = true;
     
        }catch(Exception e){
            e.printStackTrace();
        }
    	
    	return result;
    	
    }
    
    
    
    private boolean checkFileExt(String fileExt){
    	if(allowFileExt == null){
    		return false;
    	}
    	
    	if( StringUtils.trimToEmpty(fileExt).isEmpty()){
    		return true;
    	}
    	
    	fileExt = fileExt.toLowerCase() ; 

    	for(int i=0; i<allowFileExt.length ; i++){
    		if( allowFileExt[i].equals(fileExt)){
    			return true;
    		}
    	}
    	
    	return false;
    }
    
 
    
    public String getValue(String paramName){
    	// 전송받은 parameter의 한글깨짐 방지
        String value = StringUtils.defaultIfBlank(multi.getParameter(paramName), "");
        try {
			value = new String(value.getBytes("8859_1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			value = "";
		}
        
        return value;
    }
    
    public String getValue2(String paramName){
    	// 전송받은 parameter의 한글깨짐 방지
        String value = StringUtils.defaultIfBlank(multi.getParameter(paramName), "");
     /*   try {
			value = new String(value.getBytes("8859_1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			value = "";
		}*/
        
        return value;
    }
    
    public String getOrgFileNm(){
    	return uploadFile;
    }
    
    public String getSaveFileNm(){
    	return newFileName;
    }
    
    public String getFilePath(){
    	return savePath;
    }


}
