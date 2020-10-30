def table_audit_function(df):
    column_names = list(df.columns)
    columns_null_values = []
    columns_blank_values = []
    
    column_names_duplicate_list = []
    
    #Identify and rename duplicate columns 
    for i in column_names:
        if i not in column_names_duplicate_list:
            column_names_duplicate_list.append(i)
        else:
            i = i + "_2"
            column_names_duplicate_list.append(i)
            
    df.columns = column_names_duplicate_list
            
    #Check for null values:
    for i in column_names:
        if len(df[df[i].isnull()]) > 0:
            columns_null_values.append(i)
            
    if len(columns_null_values) == 0:
        print('There are no null values in any of the columns for this table.')
        
    if len(columns_null_values) > 0:
        for i in columns_null_values:
            print('There are', len(df[df[i].isnull()]), 'null values in the field', i)
    
    
    #Check for blank values:
    for i in column_names:
        for index, value in df[i].items():
            if value == '':
                columns_blank_values.append(i)
                break
            
    if len(columns_blank_values) == 0:
        print('There are no blank values in any of the columns for this table.')
        
    if len(columns_blank_values) > 0:
        for i in columns_blank_values:
            blank_count = len(df[df[i]==''])
            print('There are', blank_count, 'blank values in the field', i)
            
    return