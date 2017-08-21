package crossit.gandhi.util;


import java.io.File;
import java.io.FileNotFoundException; 
import java.util.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.*; 

import org.apache.commons.lang3.StringUtils;

public abstract class WebUtils
{ 
    public static final String SUBMIT_IMAGE_SUFFIXES[] = {
        ".x", ".y"
    }; 

    public WebUtils()
    {
    } 

    public static String trimEuckr(String temp) { 
        try{ 
        	temp = StringUtils.trimToEmpty(temp);
        	if(temp.equals(""))
        		return "";
        	temp = new String(temp.getBytes("8859_1"),"EUC-KR");
        }
        catch(Exception e){}
        
        return temp ; 
    }
    

    public static String trimUtf8(String temp) { 
        try{
        	temp = StringUtils.trimToEmpty(temp);
        	if(temp.equals(""))
        		return "";
        	temp = new String(temp.getBytes("8859_1"),"UTF-8");
        }
        catch(Exception e){}
        
        return temp ; 
    }

    /**
	 * 
	 * 접속한 PC IP 찾기
	 *  
	 * 
	 */
    public static String getRemoteIp(HttpServletRequest request){
    	String ip = StringUtils.trimToEmpty(request.getRemoteAddr()) ;
    	
    	if(ip.equals("")){
    		return request.getRemoteHost();
    	}
    	
    	return ip;
    }
    
    

    public static boolean isDefaultHtmlEscape(ServletContext servletContext)
    {
        if(servletContext == null)
        {
            return false;
        } else
        {
            String param = servletContext.getInitParameter("defaultHtmlEscape");
            return Boolean.valueOf(param).booleanValue();
        }
    }
 

    public static File getTempDir(ServletContext servletContext)
    { 
        return (File)servletContext.getAttribute("javax.servlet.context.tempdir");
    }

    public static String getRealPath(ServletContext servletContext, String path)
        throws FileNotFoundException
    { 
        if(!path.startsWith("/"))
        {
            path = "/" + path;
        }
        String realPath = servletContext.getRealPath(path);
        if(realPath == null)
        {
            throw new FileNotFoundException("ServletContext resource [" + path + "] cannot be resolved to absolute file path - " + "web application archive not expanded?");
        } else
        {
            return realPath;
        }
    }

    public static String getSessionId(HttpServletRequest request)
    { 
        HttpSession session = request.getSession(false);
        return session == null ? null : session.getId();
    }

    public static Object getSessionAttribute(HttpServletRequest request, String name)
    { 
        HttpSession session = request.getSession(false);
        return session == null ? null : session.getAttribute(name);
    }

    public static Object getRequiredSessionAttribute(HttpServletRequest request, String name)
        throws IllegalStateException
    {
        Object attr = getSessionAttribute(request, name);
        if(attr == null)
        {
            throw new IllegalStateException("No session attribute '" + name + "' found");
        } else
        {
            return attr;
        }
    }

    public static void setSessionAttribute(HttpServletRequest request, String name, Object value)
    { 
        if(value != null)
        {
            request.getSession().setAttribute(name, value);
        } else
        {
            HttpSession session = request.getSession(false);
            if(session != null)
            {
                session.removeAttribute(name);
            }
        }
    }

    public static void sessionAllRemove(HttpServletRequest request)
    {  
        HttpSession session = request.getSession(false);
        if(session != null)
        {
        	@SuppressWarnings("unchecked")
			Enumeration<String> enumeration = session.getAttributeNames() ; 
        	while (enumeration.hasMoreElements()){  
        	       session.removeAttribute(enumeration.nextElement()); 
        	}
        }
    } 
    

    public static Object getOrCreateSessionAttribute(HttpSession session, String name, Class clazz)
        throws IllegalArgumentException
    { 
        Object sessionObject = session.getAttribute(name);
        if(sessionObject == null)
        {
            try
            {
                sessionObject = clazz.newInstance();
            }
            catch(InstantiationException ex)
            {
                throw new IllegalArgumentException("Could not instantiate class [" + clazz.getName() + "] for session attribute '" + name + "': " + ex.getMessage());
            }
            catch(IllegalAccessException ex)
            {
                throw new IllegalArgumentException("Could not access default constructor of class [" + clazz.getName() + "] for session attribute '" + name + "': " + ex.getMessage());
            }
            session.setAttribute(name, sessionObject);
        }
        return sessionObject;
    } 

    public static boolean isIncludeRequest(ServletRequest request)
    {
        return request.getAttribute("javax.servlet.include.request_uri") != null;
    }

    public static void exposeForwardRequestAttributes(HttpServletRequest request)
    {
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.forward.request_uri", request.getRequestURI());
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.forward.context_path", request.getContextPath());
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.forward.servlet_path", request.getServletPath());
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.forward.path_info", request.getPathInfo());
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.forward.query_string", request.getQueryString());
    }

    public static void exposeErrorRequestAttributes(HttpServletRequest request, Throwable ex, String servletName)
    {
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.error.status_code", new Integer(200));
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.error.exception_type", ex.getClass());
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.error.message", ex.getMessage());
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.error.exception", ex);
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.error.request_uri", request.getRequestURI());
        exposeRequestAttributeIfNotPresent(request, "javax.servlet.error.servlet_name", servletName);
    }

    private static void exposeRequestAttributeIfNotPresent(ServletRequest request, String name, Object value)
    {
        if(request.getAttribute(name) == null)
        {
            request.setAttribute(name, value);
        }
    }

    public static void clearErrorRequestAttributes(HttpServletRequest request)
    {
        request.removeAttribute("javax.servlet.error.status_code");
        request.removeAttribute("javax.servlet.error.exception_type");
        request.removeAttribute("javax.servlet.error.message");
        request.removeAttribute("javax.servlet.error.exception");
        request.removeAttribute("javax.servlet.error.request_uri");
        request.removeAttribute("javax.servlet.error.servlet_name");
    }

    public static void exposeRequestAttributes(ServletRequest request, Map attributes)
    { 
        java.util.Map.Entry entry;
        for(Iterator it = attributes.entrySet().iterator(); it.hasNext(); request.setAttribute((String)entry.getKey(), entry.getValue()))
        {
            entry = (java.util.Map.Entry)it.next();
            if(!(entry.getKey() instanceof String))
            {
                throw new IllegalArgumentException("Invalid key [" + entry.getKey() + "] in attributes Map - only Strings allowed as attribute keys");
            }
        }

    }

    public static Cookie getCookie(HttpServletRequest request, String name)
    { 
        Cookie cookies[] = request.getCookies();
        if(cookies != null)
        {
            for(int i = 0; i < cookies.length; i++)
            {
                if(name.equals(cookies[i].getName()))
                {
                    return cookies[i];
                }
            }

        }
        return null;
    } 

	public static void setCookie(HttpServletResponse response, String key, String value){ 
		setCookie(response, null, key, value, -1); 
	}
	
	public static void setCookie(HttpServletResponse response, String domain, String key, String value){ 
		setCookie(response, domain, key, value, -1); 
	}

	public static void setCookie(HttpServletResponse response, String key, String value, int time){
		setCookie(response, null, key, value, time); 
	}
	
	public static void setCookie(HttpServletResponse response, String domain, String key, String value, int time){
		
		Cookie cookie1 = new Cookie(key, value);
		if(domain != null){
			cookie1.setDomain(domain);
		}
		cookie1.setPath("/");
		cookie1.setMaxAge(time);
		response.addCookie(cookie1); 
	}

    public static String findParameterValue(ServletRequest request, String name)
    {
        return findParameterValue(request.getParameterMap(), name);
    }

    public static String findParameterValue(Map parameters, String name)
    {
        String value = (String)parameters.get(name);
        if(value != null)
        {
            return value;
        }
        String prefix = name + "_";
        for(Iterator paramNames = parameters.keySet().iterator(); paramNames.hasNext();)
        {
            String paramName = (String)paramNames.next();
            if(paramName.startsWith(prefix))
            {
                for(int i = 0; i < SUBMIT_IMAGE_SUFFIXES.length; i++)
                {
                    String suffix = SUBMIT_IMAGE_SUFFIXES[i];
                    if(paramName.endsWith(suffix))
                    {
                        return paramName.substring(prefix.length(), paramName.length() - suffix.length());
                    }
                }

                return paramName.substring(prefix.length());
            }
        }

        return null;
    }

    public static Map getParametersStartingWith(ServletRequest request, String prefix)
    { 
        Enumeration paramNames = request.getParameterNames();
        Map params = new TreeMap();
        if(prefix == null)
        {
            prefix = "";
        }
        do
        {
            if(paramNames == null || !paramNames.hasMoreElements())
            {
                break;
            }
            String paramName = (String)paramNames.nextElement();
            if("".equals(prefix) || paramName.startsWith(prefix))
            {
                String unprefixed = paramName.substring(prefix.length());
                String values[] = request.getParameterValues(paramName);
                if(values != null && values.length != 0)
                {
                    if(values.length > 1)
                    {
                        params.put(unprefixed, values);
                    } else
                    {
                        params.put(unprefixed, values[0]);
                    }
                }
            }
        } while(true);
        return params;
    }

    public static int getTargetPage(ServletRequest request, String paramPrefix, int currentPage)
    {
        for(Enumeration paramNames = request.getParameterNames(); paramNames.hasMoreElements();)
        {
            String paramName = (String)paramNames.nextElement();
            if(paramName.startsWith(paramPrefix))
            {
                for(int i = 0; i < SUBMIT_IMAGE_SUFFIXES.length; i++)
                {
                    String suffix = SUBMIT_IMAGE_SUFFIXES[i];
                    if(paramName.endsWith(suffix))
                    {
                        paramName = paramName.substring(0, paramName.length() - suffix.length());
                    }
                }

                return Integer.parseInt(paramName.substring(paramPrefix.length()));
            }
        }

        return currentPage;
    }

    public static String extractFilenameFromUrlPath(String urlPath)
    {
        int end = urlPath.indexOf(';');
        if(end == -1)
        {
            end = urlPath.indexOf('?');
            if(end == -1)
            {
                end = urlPath.length();
            }
        }
        int begin = urlPath.lastIndexOf('/', end) + 1;
        String filename = urlPath.substring(begin, end);
        int dotIndex = filename.lastIndexOf('.');
        if(dotIndex != -1)
        {
            filename = filename.substring(0, dotIndex);
        }
        return filename;
    } 
}
