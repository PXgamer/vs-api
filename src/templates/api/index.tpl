{include file='include/header.tpl'}
<div class="container">
    <div class="page-header">
        <h1>API Documentation</h1>
    </div>
    <div>
        {if $api_key}
            <div class="form-group">
                <label for="api_key">API Key:</label>
                <input class="form-control" type="text" id="api_key" value="{$api_key}" readonly>
            </div>
        {/if}
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#Overview" aria-controls="home" role="tab" data-toggle="tab">Overview</a>
            </li>
            <li role="presentation">
                <a href="#Videos" aria-controls="profile" role="tab" data-toggle="tab">Videos</a>
            </li>
            <li role="presentation">
                <a href="#Users" aria-controls="messages" role="tab" data-toggle="tab">Users</a>
            </li>
            <li role="presentation">
                <a href="#Account" aria-controls="settings" role="tab" data-toggle="tab">Account</a>
            </li>
        </ul>

        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="Overview">
                <h2>Overview</h2>
                <hr>
                <h3>Authorisation</h3>
                <strong>Contents</strong>
                <ul>
                    <li><a href="#introduction-to-authentication">Introduction to Authentication</a></li>
                    <li><a href="#authorising-an-api-call">Authorising an API call</a></li>
                    <li><a href="#testing-your-authentication">Testing your authentication</a></li>
                    <li><a href="#api-responses">API Responses</a></li>
                    <li><a href="#http-redirection">HTTP Redirection</a></li>
                </ul>

                <hr>
                <h4 id="introduction-to-authentication">Introduction to Authentication</h4>
                <p>Authorisation is done using HTTP Basic auth. This uses 2 values:</p>
                <ul>
                    <li>Username - <em>The account that you sign in with.</em></li>
                    <li>API Key - <em>Displayed at the top of this page when signed in.</em></li>
                </ul>

                <hr>
                <h4 id="authorising-an-api-call">Authorising an API call</h4>
                <pre class="cli">curl -u <var>username</var>:<var>api_key</var> <var>{'api/{route}'|url}</var></pre>

                <hr>
                <h4 id="testing-your-authentication">Testing your authentication</h4>
                <p>There is a specific API route dedicated to testing whether authentication is successful. This is
                    located at <a href="{'api/validate'|url}">/api/validate</a>.</p>
                <p>Upon a successful authentication process, it will return a JSON object with details.</p>
                <pre class="cli">curl -u <var>username</var>:<var>api_key</var> <var><a
                                href="{'api/validate'|url}">{'api/validate'|url}</a></var></pre>

                <hr>
                <h3 id="api-responses">API Responses</h3>
                <div>
                    <div class="panel-group">
                        <h5>200 - OK</h5>
                        <pre class="cli">curl -u <var>username</var>:<var>api_key</var> <var>{'api/{route}'|url}</var>
<span class="output">HTTP/1.1 200 OK</span>
<span class="output">{'{'}</span>
<span class="output">  "status": true,</span>
<span class="output">  "http_code": 200,</span>
<span class="output">  "response": ...</span>
<span class="output">}</span></pre>
                    </div>
                    <div class="panel-group">
                        <h5>201 - Created</h5>
                        <pre class="cli">curl -u <var>username</var>:<var>api_key</var> <var>{'api/{route}'|url}</var>
<span class="output">HTTP/1.1 201 Created</span>
<span class="output">{'{'}</span>
<span class="output">  "status": true,</span>
<span class="output">  "http_code": 201,</span>
<span class="output">  "response": ...</span>
<span class="output">}</span></pre>
                    </div>
                    <div class="panel-group">
                        <h5>401 - Unauthorized</h5>
                        <pre class="cli">curl <var>{'api/{route}'|url}</var>
<span class="output">HTTP/1.1 401 Unauthorized</span>
<span class="output">{'{'}</span>
<span class="output">  "status": false,</span>
<span class="output">  "http_code": 401,</span>
<span class="output">  "response": "HTTP/1.0 401 Unauthorized"</span>
<span class="output">}</span></pre>
                    </div>
                    <div class="panel-group">
                        <h5>404 - Page not found</h5>
                        <pre class="cli">curl -u <var>username</var>:<var>api_key</var> <var>{'api/{route}'|url}</var>
<span class="output">HTTP/1.1 404 Not Found</span>
<span class="output">{'{'}</span>
<span class="output">  "status": false,</span>
<span class="output">  "http_code": 404,</span>
<span class="output">  "response": "HTTP/1.0 404 Not Found"</span>
<span class="output">}</span></pre>
                    </div>
                </div>

                <hr>
                <h3 id="http-redirection">HTTP Redirection</h3>
                <p>The API occasionally may send a redirect header, if appropriate. If there is a redirection, this will
                    not be an error.</p>
                <table class="table">
                    <tr>
                        <th>Status Code</th>
                        <th>Description</th>
                    </tr>
                    <tr>
                        <td>301, 308</td>
                        <td>Permanent redirect. This is used when an endpoint has permanently been moved. If this
                            occurs, the client should then send requests to the new location.
                        </td>
                    </tr>
                    <tr>
                        <td>302, 307</td>
                        <td>Temporary redirect. This is used when an endpoint has moved temporarily, it may return later
                            or become used again.
                        </td>
                    </tr>
                </table>

                <hr>
            </div>
            <div role="tabpanel" class="tab-pane" id="Videos">
                <h2>Videos</h2>
                <hr>
            </div>
            <div role="tabpanel" class="tab-pane" id="Users">
                <h2>Users</h2>
                <hr>
            </div>
            <div role="tabpanel" class="tab-pane" id="Account">
                <h2>Account</h2>
                <hr>
            </div>
        </div>
    </div>
</div>
{include file='include/footer.tpl'}