require './config/environment'

use Rack::MethodOverride

use QuoteController
use UsersController
use CommentController

run ApplicationController


