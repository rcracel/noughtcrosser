<!DOCTYPE html>
<html>
    <head>
        <title>Noughtcrosser: Tic Tac Toe</title>
        <meta name="layout" content="main" />
    </head>

    <body>

        <div class="container">
        Game number ${gameId}
                <em class="large">
                    <g:if test="${win == 1 }">			<%-- either print the winner or the next person to move --%>
                        <br>Winner: ${winner }
                        <g:form id="gameOver" url="[action:'record',controller:'Game']">
                            <g:hiddenField name="win" value="${win }" />
                            <g:hiddenField name="gameId" value="${gameId}" />
                            <g:hiddenField name="winId" value="${winId}" />
                            <g:hiddenField name="loseId" value="${loseId}" />
                            <input type="submit" value="Record results" >
                        </g:form>


                        <h4><a href="<g:createLink controller="game" action="index" />">Start new game</a></h4><br>
                    </g:if>
                    <g:elseif test="${win == 2 }">
                        <br>Tie game!
                        <g:form id="gameOver" url="[action:'record',controller:'Game']">
                            <g:hiddenField name="win" value="${win }" />
                            <g:hiddenField name="gameId" value="${gameId}" />
                            <g:hiddenField name="winId" value="${winId }" />
                            <g:hiddenField name="loseId" value="${loseId }" />
                            <input type="submit" value="Record results" >
                        </g:form>
                    </g:elseif>
                    <g:else>
                        <br>Your move, ${curMove} (<g:if test="${curMove == "X" }">${curGame.x.fullName }</g:if>
                                                    <g:else>${curGame.o.fullName}</g:else>)
                                                                            <br>
                    </g:else>
                </em>

                <table border=1 class="grid" align="center">
                    <tr>
                <g:each status="i" in="${gridArray}" var="item">	<%-- Print all 9 elements --%>
                        <g:if test="${i % 3 == 0 && i != 0}"></tr><tr></g:if>	<%-- if it's the third element in the row, start a new row --%>
                    <td>
                        <g:if test="${gridArray[i] == " "}">							<%-- If the square is blank, put in a "choose this box" button --%>
                            <g:form controller="Square" action="makeMove">
                                    <g:hiddenField name="state" value="${curMove}" />
                                    <g:hiddenField name="squareSelect" value="${i }" />
                                    <g:hiddenField name="gameId" value="${gameId}" />
                                    <input type="submit" value=" " style="width: 65px">
                            </g:form>
                        </g:if>
                        <g:else>
                            ${item.toString()}
                        </g:else>
                    </td>
                 </g:each>
                    </tr>
                 </table>
                <g:form name="madeMove" url="[action:'clearGrid',controller:'Square']">
                    <g:hiddenField name="gameId" value="${gameId}" />
                   <center><g:submitButton name="create" value="Clear board" /></center>
                </g:form>
            </div>
	</body>
</html>