create table ChatGPT(
	Datetime timestamp,
	Tweet_Id bigint,
	Text Text,
	Username varchar(255),
	Permalink varchar(512),
	User_Profile varchar(255),
	ReplyCount int,
	RetweetCount int,
	LikeCount int,
	QuoteCount int,
	ConversationId bigint,
	Language varchar(10),
	Source varchar(255),
	hashtag varchar(1024)
)