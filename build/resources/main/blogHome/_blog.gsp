<div class="blogs row">

    <h3>
        <g:link method="post" class="blog-post-title"  mapping="searchFriendlyURL"
                params='[title: "${it.title}", year: "${it.dateCreated.year + 1900}", month: "${it.dateCreated.month + 1}", day: "$it.dateCreated.date"]'

                id='${it.id}'>${it.title}</g:link>
    </h3>
    <hr/>
    <p><span class="blog-front-page-post">${it?.text}</span></p>
    <br>
    <div>
        <h5>
            Posted by <span class="blog-front-page-author">${it?.author}</span> on <span class="date-created">${it.dateCreated}</span>
        </h5>
    </div>
    <hr>

</div>
<br>