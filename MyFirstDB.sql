--
-- File generated with SQLiteStudio v3.3.3 on Tue Jul 19 15:16:24 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: DimComments
CREATE TABLE DimComments (
    CommentID    STRING  PRIMARY KEY
                         NOT NULL,
    ReviewID     STRING  NOT NULL,
    UserID       STRING  NOT NULL,
    CommentBody  STRING  NOT NULL,
    CommentLikes INTEGER NOT NULL,
    CommentDate  DATE    NOT NULL,
    CommentIP    STRING
);

INSERT INTO DimComments (
                            CommentID,
                            ReviewID,
                            UserID,
                            CommentBody,
                            CommentLikes,
                            CommentDate,
                            CommentIP
                        )
                        VALUES (
                            '38-1',
                            38,
                            36,
                            'You''re so wrong, it was cool!',
                            1,
                            '3/3/2019',
                            ''
                        );

INSERT INTO DimComments (
                            CommentID,
                            ReviewID,
                            UserID,
                            CommentBody,
                            CommentLikes,
                            CommentDate,
                            CommentIP
                        )
                        VALUES (
                            '38-2',
                            38,
                            73,
                            'I''m never wrong. I''m a real gamer.',
                            2,
                            '3/3/2019',
                            ''
                        );

INSERT INTO DimComments (
                            CommentID,
                            ReviewID,
                            UserID,
                            CommentBody,
                            CommentLikes,
                            CommentDate,
                            CommentIP
                        )
                        VALUES (
                            '38-3',
                            38,
                            36,
                            'Wrong again!',
                            1,
                            '3/3/2019',
                            ''
                        );

INSERT INTO DimComments (
                            CommentID,
                            ReviewID,
                            UserID,
                            CommentBody,
                            CommentLikes,
                            CommentDate,
                            CommentIP
                        )
                        VALUES (
                            '107-1',
                            107,
                            17,
                            'Totally Agree!',
                            0,
                            '12/3/2021',
                            ''
                        );


-- Table: DimGame
CREATE TABLE DimGame (
    GameID        STRING  PRIMARY KEY
                          NOT NULL
                          UNIQUE,
    GameName      STRING  NOT NULL,
    Author        STRING  NOT NULL,
    Publisher     STRING  NOT NULL,
    Version       INTEGER NOT NULL,
    YearPublished INTEGER NOT NULL
);

INSERT INTO DimGame (
                        GameID,
                        GameName,
                        Author,
                        Publisher,
                        Version,
                        YearPublished
                    )
                    VALUES (
                        15,
                        'BattleBoat',
                        'Sue Allen',
                        'Fun Co',
                        1,
                        1999
                    );

INSERT INTO DimGame (
                        GameID,
                        GameName,
                        Author,
                        Publisher,
                        Version,
                        YearPublished
                    )
                    VALUES (
                        52,
                        'Worddior',
                        'Jean Claude',
                        'Fun Co',
                        1,
                        2006
                    );

INSERT INTO DimGame (
                        GameID,
                        GameName,
                        Author,
                        Publisher,
                        Version,
                        YearPublished
                    )
                    VALUES (
                        99,
                        'Catacombs & Cabals',
                        'Barry Buybacks',
                        'Paper Tigers',
                        5,
                        2015
                    );

INSERT INTO DimGame (
                        GameID,
                        GameName,
                        Author,
                        Publisher,
                        Version,
                        YearPublished
                    )
                    VALUES (
                        '',
                        '',
                        '',
                        '',
                        '',
                        ''
                    );


-- Table: DimUser
CREATE TABLE DimUser (
    UserID        STRING PRIMARY KEY
                         NOT NULL
                         UNIQUE,
    UserName      STRING NOT NULL,
    [First]       STRING,
    [Last]        STRING,
    Phone         STRING,
    Email         STRING,
    StreetAddress STRING,
    City,
    State,
    Zip,
    Country,
    SignUpDate    DATE   NOT NULL,
    ReferralCode  STRING NOT NULL,
    UserDesc      TEXT
);

INSERT INTO DimUser (
                        UserID,
                        UserName,
                        [First],
                        [Last],
                        Phone,
                        Email,
                        StreetAddress,
                        City,
                        State,
                        Zip,
                        Country,
                        SignUpDate,
                        ReferralCode,
                        UserDesc
                    )
                    VALUES (
                        17,
                        'AnnE',
                        'Ann',
                        'Elmers',
                        '111-123-5959',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '1/1/2017',
                        20,
                        '"Ann Elmers"'
                    );

INSERT INTO DimUser (
                        UserID,
                        UserName,
                        [First],
                        [Last],
                        Phone,
                        Email,
                        StreetAddress,
                        City,
                        State,
                        Zip,
                        Country,
                        SignUpDate,
                        ReferralCode,
                        UserDesc
                    )
                    VALUES (
                        36,
                        'GamerGal',
                        'Sue',
                        'Ball',
                        '',
                        'sball@mail.net',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '4/23/2018',
                        42,
                        ''
                    );

INSERT INTO DimUser (
                        UserID,
                        UserName,
                        [First],
                        [Last],
                        Phone,
                        Email,
                        StreetAddress,
                        City,
                        State,
                        Zip,
                        Country,
                        SignUpDate,
                        ReferralCode,
                        UserDesc
                    )
                    VALUES (
                        73,
                        'TheCritical1',
                        'Critical',
                        'One',
                        '663-273-2089',
                        'johnnyclayton@quick.mail',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '7/1/2021',
                        17,
                        '"Keepin'' it Real!"'
                    );

INSERT INTO DimUser (
                        UserID,
                        UserName,
                        [First],
                        [Last],
                        Phone,
                        Email,
                        StreetAddress,
                        City,
                        State,
                        Zip,
                        Country,
                        SignUpDate,
                        ReferralCode,
                        UserDesc
                    )
                    VALUES (
                        74,
                        'RealThinker',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '7/1/2021',
                        33,
                        ''
                    );


-- Table: FactReviews
CREATE TABLE FactReviews (
    ReviewID    STRING  PRIMARY KEY
                        UNIQUE
                        NOT NULL
                        REFERENCES DimComments (ReviewID),
    UserID      STRING  NOT NULL
                        REFERENCES DimUser (UserID),
    GameID      STRING  NOT NULL
                        REFERENCES DimGame (GameID),
    RevDate     DATE    NOT NULL,
    Score       STRING  NOT NULL,
    ReviewBody  TEXT,
    ReviewIP    STRING  NOT NULL,
    ReviewLikes INTEGER NOT NULL
);

INSERT INTO FactReviews (
                            ReviewID,
                            UserID,
                            GameID,
                            RevDate,
                            Score,
                            ReviewBody,
                            ReviewIP,
                            ReviewLikes
                        )
                        VALUES (
                            14,
                            36,
                            52,
                            '1/1/2017',
                            3,
                            'Mid.',
                            '12.34.567.89',
                            1
                        );

INSERT INTO FactReviews (
                            ReviewID,
                            UserID,
                            GameID,
                            RevDate,
                            Score,
                            ReviewBody,
                            ReviewIP,
                            ReviewLikes
                        )
                        VALUES (
                            38,
                            73,
                            15,
                            '4/23/2018',
                            3,
                            'Not cool Enough but it was okay',
                            '11.64.636.23',
                            7
                        );

INSERT INTO FactReviews (
                            ReviewID,
                            UserID,
                            GameID,
                            RevDate,
                            Score,
                            ReviewBody,
                            ReviewIP,
                            ReviewLikes
                        )
                        VALUES (
                            107,
                            17,
                            99,
                            '12/2/2021',
                            4,
                            'One of the better games of last year!',
                            '47.18.732.55',
                            3
                        );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
