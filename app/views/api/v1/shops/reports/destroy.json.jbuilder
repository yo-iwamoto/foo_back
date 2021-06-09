json.extract! @shop, :hotpepper_id, :likesCount, :reportsCount
if @user
  json.isLiked @shop.isLikedBy(@user)
  json.isReported @shop.isReportedBy(@user)
else
  json.isLiked false
  json.isReported false
end