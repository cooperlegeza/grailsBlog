<g:each in="${blogs}">
    <ul style="list-style: none">
        <li>
            <div class="year" data-toggle="collapse" data-target=".${it.key}">
                ${it.key}
            </div>
        </li>
        <li>
            <ul style="list-style: none" data-role="listview">
                <g:set var="year" value="${it.key}"/>
                <g:each in="${it.value}">
                    <g:if test="${it.value.size() > 0}">
                        <li>
                            <div class="collapse month ${year}" data-toggle="collapse" data-target=".${it.key}">
                                ${it.key} (${it.value.size()})
                            </div>
                        </li>
                        <g:set var="month" value="${it.key}"/>
                        <g:each in="${it.value}">
                            <li>
                                <span class="collapse ${month}">
                                    <g:link mapping="searchFriendlyURL"
                                            params='[title: "${it.title}", year: "${it.dateCreated.year + 1900}", month: "${it.dateCreated.month + 1}", day: "$it.dateCreated.date"]'
                                            id='${it.id}' class="in-month most-recent-blog">${it.title}</g:link> by ${it.author} on <span class="most-recent-date-created" title="${it.dateCreated}"><g:formatDate format="MM/dd"  date="${it.dateCreated}"/></span>
                                </span>
                            </li>
                        </g:each>
                    </g:if>
                </g:each>
            </ul>
        </li>
    </ul>
</g:each>