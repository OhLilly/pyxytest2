select * 
from {{ source('dev', 'users') }}