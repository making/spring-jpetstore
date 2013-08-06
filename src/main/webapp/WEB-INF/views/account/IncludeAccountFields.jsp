<h3>Account Information</h3>

<table>
    <tr>
        <td>First name:</td>
        <td><form:input path="firstName" /> <form:errors
                path="firstName" /></td>
    </tr>
    <tr>
        <td>Last name:</td>
        <td><form:input path="lastName" /> <form:errors
                path="lastName" /></td>
    </tr>
    <tr>
        <td>Email:</td>
        <td><form:input size="40" path="email" /> <form:errors
                path="email" /></td>
    </tr>
    <tr>
        <td>Phone:</td>
        <td><form:input path="phone" /> <form:errors path="phone" /></td>
    </tr>
    <tr>
        <td>Address 1:</td>
        <td><form:input size="40" path="address1" /> <form:errors
                path="address1" /></td>
    </tr>
    <tr>
        <td>Address 2:</td>
        <td><form:input size="40" path="address2" /> <form:errors
                path="address2" /></td>
    </tr>
    <tr>
        <td>City:</td>
        <td><form:input path="city" /> <form:errors path="city" /></td>
    </tr>
    <tr>
        <td>State:</td>
        <td><form:input size="4" path="state" /> <form:errors
                path="state" /></td>
    </tr>
    <tr>
        <td>Zip:</td>
        <td><form:input size="10" path="zip" /> <form:errors
                path="zip" /></td>
    </tr>
    <tr>
        <td>Country:</td>
        <td><form:input size="15" path="country" /> <form:errors
                path="country" /></td>
    </tr>
</table>

<h3>Profile Information</h3>

<table>
    <tr>
        <td>Language Preference:</td>
        <td><form:select path="languagePreference"
                items="${languageList}" /> <form:errors
                path="languagePreference" /></td>
    </tr>
    <tr>
        <td>Favourite Category:</td>
        <td><form:select path="favouriteCategoryId"
                items="${categoryList}" /> <form:errors
                path="favouriteCategoryId" /></td>
    </tr>
    <tr>
        <td>Enable MyList</td>
        <td><form:checkbox path="listOption" /> <form:errors
                path="listOption" /></td>
    </tr>
    <tr>
        <td>Enable MyBanner</td>
        <td><form:checkbox path="bannerOption" /> <form:errors
                path="bannerOption" /></td>
    </tr>
</table>
