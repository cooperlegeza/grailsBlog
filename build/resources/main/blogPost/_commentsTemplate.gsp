<div class="row">
    <span>
        <font color="red"><b><span class="comment-author">${it.author}</span></b> <span class="comment-date-created" title="${it.dateCreated}"><g:formatDate format="MMM dd, yyyy" date="${it.dateCreated}"/> at <g:formatDate format="hh:mm aaa" date="${it.dateCreated}"/></span></font>
    </span>
</div>
<div class="comment-text row">${it.comment}</div>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Edit</button>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                    <p>Some text in the modal.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</sec:ifAnyGranted>
<hr>
<br>