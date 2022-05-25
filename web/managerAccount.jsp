<%-- 
    Document   : managerAccount
    Created on : May 24, 2022, 1:00:24 PM
    Author     : Minh Hoàng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manager Account Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="css/stylePopup.css">
    </head>
    <body>
        <button class="open-modal-btn">dang ki tai khoan</button>
        <div class="modal hide">
            <div class="modal__inner">
                <div class="modal__header">
                    <p>dang ki</p>
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <div class="modal__body">
                    <div id="cd-signup"> 
                        <!-- sign up form -->
                        <form action="MainController" method="POST" class="cd-form">
                            <p class="fieldset">
                                <label class="image-replace cd-username" for="signup-username">Username
                                </label>
                                <input class="full-width has-padding has-border" id="signup-username" name="userName" type="text" placeholder="Username">
                                <!--                         <span class="cd-error-message">Username không được bỏ trống! 
                                                        </span>-->
                            </p>
                            <p class="fieldset">
                                <label class="image-replace cd-email" for="signup-email">Email
                                </label>
                                <input class="full-width has-padding has-border" id="signup-email" name="email" type="email" placeholder="E-mail">
                                <!--                         <span class="cd-error-message">Email không được bỏ trống! 
                                                        </span>-->
                            </p>
                            <p class="fieldset">
                                <label class="image-replace cd-password" for="signup-password">Password
                                </label>
                                <input class="full-width has-padding has-border" id="signup-password" name="password" type="password"  placeholder="Password">
                                <a href="#0" class="hide-password">Hide
                                </a>
                                <!--                         <span class="cd-error-message">Password không được bỏ trống! 
                                                        </span>-->
                            </p>

                            <p class="fieldset">
                                <input class="full-width has-padding" type="submit" name="action" value="createAccount">
                            </p>
                        </form>
                        <!-- <a href="#0" class="cd-close-form">Close</a> -->
                    </div> 
                    <!-- cd-signup -->

                </div>
                <div class="modal__footer">
                    <button>Close</button>
                </div>
            </div>
        </div>
    </body>
    <script src="js/popup.js"></script>
</html>
