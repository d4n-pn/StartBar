#include "loadmodel.h"
#include <QDebug>


QFileSystemModel *LoadModel::model() const
{
    return m_model;
}

void LoadModel::creatExampleTreeFileName()
{
    FileName *filename1 = new FileName();
    FileName *filename2 = new FileName();
    FileName *filename3 = new FileName();
    FileName *filename4 = new FileName();
    FileName *filename5 = new FileName();
    filename1->setFilename("file1");
    filename2->setFilename("file2");
    filename3->setFilename("file3");
    filename4->setFilename("file4");
    filename5->setFilename("file5");
    filename1->setIsDir(true);
    filename3->setIsDir(true);
    filename1->addSubDir(filename2);
    filename3->addSubDir(filename4);

    m_filename->addSubDir(filename1);
    m_filename->addSubDir(filename3);
    m_filename->addSubDir(filename5);
    m_filename->setIsDir(true);
}

FileName *LoadModel::filename() const
{
    return m_filename;
}

LoadModel::LoadModel()
{
    m_filename = new FileName();
    m_filename->setFilename("C:/Users/dan11/OneDrive/Pictures");
    QDir dir("C:/Users/dan11/OneDrive/Pictures");
//    QDir dir("C:/");
    m_model = new QFileSystemModel;
    m_model->setRootPath(QDir::currentPath());
    m_model->setFilter(QDir::Dirs | QDir::Files );
    m_model->sort(0,Qt::AscendingOrder);
    addFileTree(m_filename, dir);
    qDebug() << m_model->fileName(m_model->index(dir.path()));
    // tao model mau
//    creatExampleTreeFileName();
}

void LoadModel::addFileTree(FileName *fileName, QDir dir)
{
    dir.setFilter(QDir::Dirs | QDir::Files );
    dir.setSorting(QDir::Name);
    qDebug() << dir.count();
    QFileInfoList list = dir.entryInfoList();
        qDebug() << "     Bytes Filename";
        for (int i = 0; i < list.size(); ++i) {

            FileName *tmp_file = new FileName();
            QFileInfo fileInfo = list.at(i);
//            qDebug() << qPrintable(QString("%1 %2").arg(fileInfo.size(), 10)
//                                                    .arg(fileInfo.fileName()));
            if(fileInfo.isDir()&&(fileInfo.fileName() != ".")&&(fileInfo.fileName() != "..")){
                QDir subDir = fileInfo.dir();
                if(subDir.cd(fileInfo.fileName())){
                    addFileTree(tmp_file, subDir);
                }
            }

            // add filename
            if((fileInfo.fileName() != ".")&&(fileInfo.fileName() != "..")){
                tmp_file->setIsDir(fileInfo.isDir());
                tmp_file->setFilename(fileInfo.fileName());
                fileName->addSubDir(tmp_file);
            }
        }
}

