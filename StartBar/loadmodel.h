#ifndef LOADMODEL_H
#define LOADMODEL_H

#include <QDir>
#include "filename.h"
#include <QFileSystemModel>

class LoadModel
{
private:
    FileName * m_filename;
    QFileSystemModel *m_model;
public:
    LoadModel();
    void addFileTree(FileName *fileName, QDir dir);
    QFileSystemModel *model() const;
    void creatExampleTreeFileName();
    FileName *filename() const;
};

#endif // LOADMODEL_H
