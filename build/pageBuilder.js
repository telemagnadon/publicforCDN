// Generic Schema Builder
function BuildDynamicForm(schema, currentData = {}, containerId = 'EditProductForm') {
    let html = "";
    const formClass = schema.formClass;

    schema.fields.forEach(field => {
        const key = field.key;
        const label = field.label;
        const value = currentData[field.dataKey || key.replace('Edit', '').toLowerCase()] || '';
        const required = field.required || false;

        switch (field.type) {
            case 'text':
                html += UIInputGroup(
                    field.placeholder || label,
                    'text',
                    key,
                    label,
                    formClass,
                    '',
                    '',
                    required,
                    value,
                    field.datalistUrl ? `${key}DataList` : ''
                );
                if (field.datalistUrl) {
                    html += ArraytoDatalist(`${key}DataList`, [], false);
                    QueryandReplaceDatalist(`${key}DataList`, field.datalistUrl, 'POST', null, true);
                }
                break;

            case 'textarea':
                html += UIInputGroupTEXTAREA(label, key, required, value, formClass);
                break;

            case 'number':
                html += UIInputGroupNumber(
                    field.placeholder || label,
                    key,
                    label,
                    formClass,
                    value,
                    '',
                    '',
                    '',
                    required
                );
                break;

            case 'filedrop':
                html += UIInputGroupFileUploadDropzone(
                    field.key,
                    field.label,
                    field.uploadUrl
                );
                break;

            default:
                console.warn("Unknown field type:", field);
        }
    });

    html += UIInputGroupButton('Submit', formClass, '', 'LoadDataPageFunc.TryToSubmit()', '');
    html = CreateCardSimple(false, html);

    document.getElementById(containerId).innerHTML = html;

    // Initialize Dropzones if present
    schema.fields.filter(f => f.type === 'filedrop').forEach(f => {
        InitializeLoadDataPageFuncDropZonePhotoUpload(f.uploadUrl, f.key, '', 'clearuploadbutton', '', 100);
        if (currentData.photourlDropzone)
            currentDropzone[f.key].functions.ReplaceDropzoneFiles(currentData.photourlDropzone);
    });
}

