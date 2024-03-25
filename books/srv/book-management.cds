using { db } from '../db/user';

service BookManagement {
    entity Books as projection on db.Books order by publishedYear desc, title asc;
    entity FilterBooks as select from db.Books where publishedYear > 2000;
    entity OrderBooks as projection on db.Books order by publishedYear desc, title asc;
    entity FilterByNameAuthorAndTitleBooks as select title, author from db.Books where publishedYear < 1990; 
}