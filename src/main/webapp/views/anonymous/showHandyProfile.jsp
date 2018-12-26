<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><strong><spring:message code="anonymous.showHandyProfile" />: <jstl:out value="${handyWorker.make}"/></strong></p>

<br/>

<table>
	<tr>
		<td><spring:message code="handyWorker.fullName" /></td> 
		<td><jstl:out value="${handyWorker.name} ${handyWorker.middleName} ${handyWorker.surname}" /> </td>
	</tr>
	<tr>
		<td><spring:message code="handyWorker.email"/></td> 
		<td><jstl:out value="${handyWorker.email}" /> </td>
	</tr>
	<tr>
		<td><spring:message code="handyWorker.phoneNumber"/></td> 
		<td><jstl:out value="${handyWorker.phoneNumber}" /> </td>
	</tr>
	<tr>
		<td><spring:message code="handyWorker.address"/></td> 
		<td><jstl:out value="${handyWorker.address}" /></td>
	</tr>
	<tr>
		<td><spring:message code="handyWorker.score"/></td> 
		<td><jstl:out value="${handyWorker.score}" /></td>
	</tr>
	<tr>
		<td><spring:message code="handyWorker.photo"/></td> 
		<td><img src="${handyWorker.photo}" alt="${handyWorker.photo}" style="width:100px;height:100px;border:0;"/> </td>
	</tr>

</table>
<br/>
<strong><spring:message code="anonymous.showHandyProfileSocialProfiles" />:</strong>

<display:table
	pagesize="5" name="${handyWorker.socialProfiles}" id="row"
	requestURI="${requestURI}">
	
	<display:column property="nick" titleKey="socialProfile.nick">
	</display:column>
	<display:column property="name" titleKey="socialProfile.name">
	</display:column>
	<display:column titleKey="socialProfile.profileLink">
		<a href="${row.profileLink}" ><spring:message code="handyWorker.linkProfile" /></a>
	</display:column>
</display:table>

<br/>
<br/>


<jstl:choose>
	<jstl:when test="${canEdit}">
		<spring:url var="showTutorialUrl" value="tutorial/handyWorker/listHandyTutorials.do">	
		</spring:url>
		<a href="${showTutorialUrl}">
			<strong><spring:message code="handyWorker.myTutorials" />: <jstl:out value="${handyWorker.make}"/></strong>			
		</a>
	</jstl:when>
	<jstl:otherwise>
		<spring:url var="showTutorialUrl" value="tutorial/anonymous/listHandyTutorials.do">
			<spring:param name="handyId" value="${handyWorker.id}"/>	
		</spring:url>
		<a href="${showTutorialUrl}">
			<strong><spring:message code="anonymous.showHandyProfileTutorials" />: <jstl:out value="${handyWorker.make}"/></strong>			
		</a>
	</jstl:otherwise>
</jstl:choose>


